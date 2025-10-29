import 'dart:developer';

part 'src/console_log.dart';
part 'src/console_print.dart';
part 'src/ignore_log.dart';

/// A lightweight logging interface for console and debug output.
///
/// `AppLog` automatically chooses the appropriate logging backend:
///
/// - In **debug mode**, logs use `dart:developer.log`, which integrates with
///   IDE consoles, DevTools and filtering by tag.
/// - In **release mode**, logs fall back to simple `print` output.
/// - If [enableLogs] is `false`, all logs are silently ignored.
///
/// This makes the logger zero-config and environment-aware.
abstract class AppLog {
  /// Creates an environment aware logging instance.
  ///
  /// If [enableLogs] is `false`, all logs are ignored.
  /// If [enableLogs] is `true`, the logger automatically selects:
  ///
  /// - `_APPConsoleLog` when running in debug mode
  /// - `_APPConsolePrint` when running in release mode
  factory AppLog.create({bool enableLogs = false, String logTag = ''}) {
    if (!enableLogs) return _APPIgnoreLog();

    return _applicationRunningInDebugEnv()
        ? _APPConsoleLog(logTag)
        : _APPConsolePrint(logTag);
  }

  /// Outputs an informational message.
  void info(String message);

  /// Outputs a warning message.
  void warn(String message);

  /// Outputs an error message with optional [error] and [stackTrace].
  void error(String message, {Object? error, StackTrace? stackTrace});

  // Returns `true` when running in a debug environment.
  //
  // Since this package does not depend on Flutter, `kDebugMode` is not
  // available. Using an `assert` is the only reliable way to detect debug
  // builds in pure Dart.
  static bool _applicationRunningInDebugEnv() {
    bool debuggable = false;

    assert(() {
      debuggable = true;
      return true;
    }());

    return debuggable;
  }
}
