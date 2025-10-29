<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

A lightweight, zero-configuration logging utility for Dart and Flutter.

`app_log` provides a simple logging interface that automatically adapts to your build environment.

- In **debug mode**, it uses `dart:developer.log` for rich, filterable output in IDEs and DevTools.
- In **release mode**, it falls back to the standard `print()` function for simple console output.
- When disabled, all logging calls are completely ignored with no performance overhead.

## Features

- ✅ Environment-aware: Automatically switches between `developer.log` and `print()`.
- ✅ Zero-config: Works out of the box with sensible defaults.
- ✅ Toggable: Easily enable or disable logging globally.
- ✅ Lightweight: No external dependencies.
- ✅ Log tagging: Group and filter logs by a custom tag.

## Getting started

Add `app_log` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  app_log: ^0.0.1 # Replace with the latest version
```

Then, run `flutter pub get`.

## Usage

Import the package and create a logger instance.

```dart
import 'package:app_log/log.dart';

final log = AppLog.create(enableLogs: true, logTag: 'MyApp');

void main() {
  log.info('Application starting...');
  log.warn('Configuration is missing, using defaults.');
  
  try {
    throw Exception('Something went wrong!');
  } catch (e, s) {
    log.error('An unexpected error occurred', error: e, stackTrace: s);
  }
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
