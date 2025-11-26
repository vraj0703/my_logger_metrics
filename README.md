# Logger and Metrics Plugin

This plugin provides a universal logger and metrics interface for Flutter projects, configurable via flavors.

## Features

- **Unified Logger**: Wrapper around `logger` package with flavor-based log levels.
- **Metrics Tracking**: Integration with `aptabase_flutter` for privacy-friendly analytics.
- **Flavor Configuration**: Easy configuration for DEV, TEST, STAGING, and PROD environments.
- **Time Tracking**: Helper method `timeEvent` to track duration of operations.
- **Convenience Aliases**: Use `$logger` and `$metric` for cleaner code.

## Usage

### Initialization

Initialize the plugin in your `main.dart` before `runApp`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MyLoggerMetrics.init(
    config: AppConfig(
      flavor: Flavor.DEV, // or Flavor.PROD based on build environment
      aptabaseAppKey: 'YOUR-APTABASE-KEY', // Optional: Omit if you only want logging
    ),
  );

  runApp(const MyApp());
}
```

### Logging

You can use the static methods on `MyLoggerMetrics` or the `$logger` alias:

```dart
$logger.d('Debug message');
$logger.i('Info message');
$logger.w('Warning message');
$logger.e('Error message', error, stackTrace);
```

### Metrics

You can use the static methods on `MyLoggerMetrics` or the `$metric` alias:

```dart
// Track a simple event
await $metric.trackEvent('button_clicked', {'id': 'login_btn'});

// Track a timed event
final stopTimer = $metric.timeEvent('api_call');
// ... perform operation ...
await stopTimer({'result': 'success'}); // Logs event with 'duration_ms'
```

## Testing

The project follows TDD. You can run the tests using:

```bash
flutter test
```

## Configuration

The `AppConfig` class controls the behavior:

- **DEV**: Log Level `debug`
- **TEST**: Log Level `trace`
- **STAGING**: Log Level `info`
- **PROD**: Log Level `error`
