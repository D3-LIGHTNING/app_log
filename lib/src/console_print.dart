// ignore_for_file: avoid_print
part of '../logger.dart';

// Logging implementation that outputs messages using `print()`.
//
// `_APPConsolePrint` is best suited for command-line tools, scripts,
// and simple debugging where IDE or DevTools log integration is not
// required.
//
// Each message includes a timestamp, log level, and optional [logTag].
// Error logs also print the associated [error] and [stackTrace], if provided.
//
// Example printed output:
// ```text
// [AUTH] [Time: 2025-10-28 12:42:18.812] [Level: INFO] Login successful
// ```
//
// Typically created internally by:
// ```dart
// final log = AppLog.create(enableLogs: true, logTag: "AUTH");
// ```
final class _APPConsolePrint implements AppLog {
  // Optional tag used to group printed messages.
  final String logTag;

  // Creates a print-based logger.
  const _APPConsolePrint(this.logTag);

  @override
  void info(String message) =>
      print("[$logTag] [Time: $_currentTime] [Level: INFO] $message");

  @override
  void warn(String message) =>
      print("[$logTag] [Time: $_currentTime] [Level: WARNING] $message");

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    print("[$logTag] [Time: $_currentTime] [Level: ERROR] $message");
    if (error != null) print("[$logTag] $error");
    if (stackTrace != null) print("[$logTag] $stackTrace");
  }

  // Returns the current system timestamp.
  static DateTime get _currentTime => DateTime.now();
}
