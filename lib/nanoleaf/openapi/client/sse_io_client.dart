import 'dart:async';
import 'dart:io';

/// Simple IO based SSE client since the flutter/dart HTTP client does not work
/// with SSE.
class SSEIOClient {
  static final _newLine = '\n'.codeUnitAt(0);
  static final _carriageReturn = '\r'.codeUnitAt(0);

  static Stream<SSEEvent> stream(String host, int port, String path) {
    // Linter does not detect that the socket is closed when paused or cancelled
    // ignore: close_sinks
    Socket? currentSocket;

    // Linter does not detect that the controller is closed when cancelled
    // ignore: close_sinks
    StreamController<SSEEvent>? controller;

    bool handshakeDone = false;

    List<int> buffer = [];

    void processResponse(List<int> responseBuffer) {
      // Convert response to a string and filter out all empty lines
      final response = String.fromCharCodes(responseBuffer);
      final lines = response
          .split("\n")
          .map((s) => s.trim())
          .where((s) => s.length > 0);

      if (lines.length < 1) {
        // Empty responses are invalid
        controller!.addError(
            InvalidEventFormatError("Event stream sent empty lines only"));
        return;
      }

      if (!handshakeDone) {
        // HTTP handshake still needs to be done
        final first = lines.first;

        // The first HTTP line is always "<proto> <status> <phrase>"
        final parts = first.split(" ");

        if (parts.length < 3) {
          // Invalid response head
          controller!.addError(HttpException(
              "Expected first HTTP response line to consist of 3 or more parts, "
              "but got ${parts.length} in $first"));
          return;
        } else if (parts[0] != "HTTP/1.1") {
          // We only support HTTP/1.1
          controller!.addError(HttpException(
              "Expected HTTP protocol version 1.1, but got ${parts[0]}"));
          return;
        }

        final statusCode = int.tryParse(parts[1]);
        if (statusCode == null) {
          // Status code was not an integer
          controller!.addError(
              HttpException("Expected second part to be a HTTP status code, "
                  "but got ${parts[1]}"));
          return;
        } else if (statusCode != 200) {
          // Non 200 status
          controller!.addError(HttpException("Expected HTTP status 200 (OK), "
              "but got $statusCode (${parts.sublist(2).join(" ")})"));
          return;
        }

        // Handshake succeeded
        handshakeDone = true;
        return;
      }

      // An even consists of 2 lines after trimming:
      // id: <id>
      // data: <json>
      if (lines.length != 2) {
        controller!.addError(InvalidEventFormatError(
            "Expected event to contain exactly 2 lines, but got only one"));
        return;
      }

      final first = lines.first;
      final second = lines.last;

      // The first line must always be the id line
      if (!first.startsWith("id: ")) {
        controller!.addError(InvalidEventFormatError(
            "Expected first line to start with 'id: ', but got $first"));
        return;
      }

      int? id = int.tryParse(first.substring(4));

      // Should not be possible
      if (id == null) {
        controller!.addError(InvalidEventFormatError(
            "Expected $first to contain a number after 'id: '"));
        return;
      } else if (id < 1 || id > 4) {
        // Unknown event
        print("Got unknown event id $id");
        return;
      }

      // The second line must always be the line containing the Json data
      if (!second.startsWith("data: ")) {
        controller!.addError(InvalidEventFormatError(
            "Expected second line to start with 'data: ', but got $second"));
        return;
      }

      // Extract event data
      final data = second.substring(6);

      // Submit event to the stream
      controller!.add(SSEEvent(id, data));
    }

    Future connect() async {
      // Establish a socket connection and write out the HTTP request
      currentSocket = await Socket.connect(host, port);
      currentSocket!
          .listen(
              (data) {
                for (final byte in data) {
                  if(byte == _carriageReturn) {
                    // Drop carriage returns due to the buggy mess the Nanoleaf
                    // http server is
                    continue;
                  }

                  if (buffer.length >= 2 &&
                      byte == _newLine &&
                      buffer.elementAt(buffer.length - 1) == _newLine) {
                    // Got 2 \n in a row, this is the end of one response
                    processResponse(buffer.sublist(0, buffer.length - 1));
                    buffer.clear();
                  } else {
                    // Add more bytes, since we have no full response yet
                    buffer.add(byte);
                  }
                }
              },
              onError: controller!.addError,
              onDone: () {
                if (buffer.isNotEmpty) {
                  processResponse(buffer);
                }

                controller!.close();
              })
          .asFuture()
          .then((value) {
        if (buffer.isNotEmpty) {
          processResponse(buffer);
        }

        controller!.close();
      });

      try {
        currentSocket!.write("GET $path HTTP/1.1\r\n"
            "\r\n"
            "\r\n");
      } catch (e) {
        print(e);
        return;
      }

      await currentSocket!.flush();
    }

    Future disconnect() async {
      await currentSocket!.close();
    }

    controller = StreamController<SSEEvent>.broadcast(
        onListen: connect,
        onCancel: () async {
          await controller!.close();
          await disconnect();
        });

    return controller.stream;
  }
}

/// Error thrown when the event stream yields an invalid format.
class InvalidEventFormatError extends Error {
  final String message;

  InvalidEventFormatError(this.message);

  @override
  String toString() => message;
}

/// Simple SSE event structure
class SSEEvent {
  final int id;
  final String data;

  SSEEvent(this.id, this.data);
}
