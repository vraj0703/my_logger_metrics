import 'package:flutter/foundation.dart';
import 'package:my_logger_metrics/src/config/app_config.dart';
import 'package:my_logger_metrics/src/logger/app_logger.dart';
import 'package:my_logger_metrics/src/metrics/app_metrics.dart';
import 'package:my_logger_metrics/src/metrics/aptabase_metrics_client.dart';
import 'package:my_logger_metrics/src/metrics/noop_metrics_client.dart';

export 'src/config/app_config.dart';
export 'src/logger/app_logger.dart';
export 'src/metrics/app_metrics.dart';

class MyLoggerMetrics {
  static MyLoggerMetrics? _instance;

  final AppLogger _logger;
  final AppMetrics _metrics;

  MyLoggerMetrics._({required AppLogger logger, required AppMetrics metrics})
    : _logger = logger,
      _metrics = metrics;

  static Future<void> init({
    required AppConfig config,
    @visibleForTesting AppLogger? logger,
    @visibleForTesting AppMetrics? metrics,
  }) async {
    final appLogger = logger ?? AppLogger(config: config);

    AppMetrics appMetrics;
    if (metrics != null) {
      appMetrics = metrics;
    } else if (config.aptabaseAppKey != null) {
      final client = AptabaseMetricsClient(appKey: config.aptabaseAppKey!);
      await client.init();
      appMetrics = AppMetrics(client: client);
    } else {
      appMetrics = AppMetrics(client: NoOpMetricsClient());
    }

    _instance = MyLoggerMetrics._(logger: appLogger, metrics: appMetrics);
  }

  static MyLoggerMetrics get instance {
    if (_instance == null) {
      throw Exception('MyLoggerMetrics not initialized. Call init() first.');
    }
    return _instance!;
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    instance._logger.d(message, error, stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    instance._logger.i(message, error, stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    instance._logger.w(message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    instance._logger.e(message, error, stackTrace);
  }

  static Future<void> trackEvent(
    String eventName, [
    Map<String, dynamic>? props,
  ]) async {
    await instance._metrics.trackEvent(eventName, props);
  }

  static Future<void> Function([Map<String, dynamic>? props]) timeEvent(
    String eventName,
  ) {
    return instance._metrics.timeEvent(eventName);
  }
}
