part of '../logger.dart';

// Logging implementation that uses `dart:developer.log` for output.
//
// `_APPConsoleLog` integrates with IDE consoles, DevTools, and filtering
// by [logTag], making it useful for debugging during development.
//
// Each message is timestamped and labeled with a log level.
//
// Example output:
// ```text
// [Time: 2025-10-28 12:41:05.123] [Level: INFO] User logged in
// ```
//
// This class is typically constructed through:
// ```dart
// final log = AppLog.create(enableLogs: true, logTag: "AUTH");
// ```
final class _APPConsoleLog implements AppLog {
  // Optional tag used to group, filter or identify log messages.
  final String logTag;

  // Creates a console logger that writes to developer tools.
  const _APPConsoleLog(this.logTag);

  @override
  void info(String message) => log(
    "[Time: $_currentTime] [Level: INFO] $message",
    name: logTag,
    time: _currentTime,
  );

  @override
  void warn(String message) => log(
    "[Time: $_currentTime] [Level: WARNING] $message",
    name: logTag,
    time: _currentTime,
  );

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) => log(
    "[Time: $_currentTime] [Level: ERROR] $message",
    name: logTag,
    error: error,
    stackTrace: stackTrace,
    time: _currentTime,
  );

  // Returns the current system timestamp.
  static DateTime get _currentTime => DateTime.now();
}
