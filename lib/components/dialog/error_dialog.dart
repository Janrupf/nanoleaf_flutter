import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Simple dialog containing an error message
class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final dynamic error;
  final VoidCallback? onDismissed;

  ErrorDialog(
      {Key? key,
      required this.title,
      required this.message,
      required this.error,
      this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: [Text(message), Text(error.toString())],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => onDismissed != null
                  ? onDismissed!.call()
                  : Navigator.of(context).pop(),
              child: Text(Intl.message("Ok")))
        ],
      );
}
