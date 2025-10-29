part of '../logger.dart';

// A no-op implementation of [AppLog] that ignores all log messages.
//
// This logger intentionally performs no logging. It is useful when logging
// should be disabled without modifying existing logging calls throughout the
// codebase.
//
// Typically constructed through:
// ```dart
// final log = AppLog.create(enableLogs: false);
// ```
//
// All `info`, `warn`, and `error` calls are silently ignored.
final class _APPIgnoreLog implements AppLog {
  // Creates an instance of the ignore logger.
  //
  // All log methods will do nothing.
  const _APPIgnoreLog();

  @override
  void info(String message) {}

  @override
  void warn(String message) {}

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {}
}
