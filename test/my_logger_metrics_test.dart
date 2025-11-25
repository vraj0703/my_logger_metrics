import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_logger_metrics/my_logger_metrics.dart';
import 'package:my_logger_metrics/src/metrics/aptabase_metrics_client.dart';
import 'package:my_logger_metrics/flavor.dart';

@GenerateMocks([AppLogger, AppMetrics, AptabaseMetricsClient])
import 'my_logger_metrics_test.mocks.dart';

void main() {
  group('MyLoggerMetrics Tests', () {
    late MockAppLogger mockLogger;
    late MockAppMetrics mockMetrics;

    setUp(() {
      mockLogger = MockAppLogger();
      mockMetrics = MockAppMetrics();
    });

    test('should initialize correctly and delegate calls', () async {
      final config = AppConfig(flavor: Flavor.DEV, aptabaseAppKey: 'test');

      // Initialize with mocks
      await MyLoggerMetrics.init(
        config: config,
        logger: mockLogger,
        metrics: mockMetrics,
      );

      MyLoggerMetrics.d('debug');
      verify(mockLogger.d('debug')).called(1);

      MyLoggerMetrics.trackEvent('event');
      verify(mockMetrics.trackEvent('event')).called(1);
    });
  });
}
