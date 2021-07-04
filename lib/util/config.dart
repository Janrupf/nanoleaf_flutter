import 'package:flutter/foundation.dart';
import 'package:nanoleaf_flutter/util/config/native_config.dart';

/// Platform independent abstraction of a platform dependent
/// configuration.
abstract class ApplicationConfig {
  /// Creates a new application config based on the running platform.
  factory ApplicationConfig() {
    if (kIsWeb) {
      // TODO:
      throw UnimplementedError("Config not implemented for web");
    } else {
      return NativeApplicationConfig();
    }
  }

  /// Loads the type [T] from the application config [key].
  Future<T?> load<T extends Object>(String key);

  /// Loads a list with values of the type [T] from the application config [key].
  Future<List<T>?> loadList<T extends Object>(String key);

  /// Saves the [value] of type [T] as [key] in the application config.
  Future save<T extends Object>(String key, T value);
}
