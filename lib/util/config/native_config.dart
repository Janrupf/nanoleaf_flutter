import 'dart:io';

import 'package:nanoleaf_flutter/util/config.dart';
import 'package:nanoleaf_flutter/util/serializers.dart';

// TODO: Wait for this library to be migrated
// ignore: import_of_legacy_library_into_null_safe
import 'package:path_provider/path_provider.dart';

class NativeApplicationConfig implements ApplicationConfig {
  Directory? _directory;

  @override
  Future<T?> load<T extends Object>(String key) async {
    final directory = await _getDirectory();
    final file = File("${directory.path}/$key.json");

    if (!await file.exists()) {
      return Future.value(null);
    }

    return deserializeJsonValue<T>(await file.readAsString());
  }

  @override
  Future<List<T>?> loadList<T extends Object>(String key) async {
    final directory = await _getDirectory();
    final file = File("${directory.path}/$key.json");

    if (!await file.exists()) {
      return Future.value(null);
    }

    return deserializeJsonList<T>(await file.readAsString());
  }

  @override
  Future save<T extends Object>(String key, T value) async {
    final directory = await _getDirectory();
    final file = File("${directory.path}/$key.json");

    if (!await file.parent.exists()) {
      await file.parent.create(recursive: true);
    }

    String serialized = serializeJsonValue<T>(value);
    await file.writeAsString(serialized);
  }

  /// Retrieves and caches the directory to store application configs into.
  Future<Directory> _getDirectory() async {
    if (_directory != null) {
      return _directory!;
    }

    if (Platform.isLinux) {
      // The path_provider library is failing when it shouldn't on Linux
      return await _getLinuxDirectory();
    }

    _directory = await getApplicationDocumentsDirectory();
    if (_directory == null) {
      throw UnimplementedError(
          "Retrieving the directory for documents on the current platform is not supported");
    }

    return _directory!;
  }

  /// Retrieves the configuration directory on Linux avoiding bugs in the
  /// xdg_directories package used by path_provider.
  Future<Directory> _getLinuxDirectory() async {
    String configBase = Platform.environment["XDG_CONFIG_DIR"] ??
        // Assume HOME is set, it is required on every POSIX system (and Linux)
        "${Platform.environment["HOME"]}/.config";

    return Directory("$configBase/nanoleaf-flutter");
  }
}
