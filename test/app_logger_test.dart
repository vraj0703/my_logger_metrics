import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_logger_metrics/src/config/app_config.dart';
import 'package:my_logger_metrics/src/logger/app_logger.dart';
import 'package:my_logger_metrics/flavor.dart';

// Generate mocks
@GenerateMocks([Logger])
import 'app_logger_test.mocks.dart';

void main() {
  group('AppLogger Tests', () {
    late MockLogger mockLogger;
    late AppLogger appLogger;

    setUp(() {
      mockLogger = MockLogger();
    });

    test('should log debug message when log level allows', () {
      final config = AppConfig(flavor: Flavor.DEV, aptabaseAppKey: 'test');
      appLogger = AppLogger(config: config, logger: mockLogger);

      appLogger.d('debug message');

      verify(mockLogger.d('debug message')).called(1);
    });

    test('should log info message', () {
      final config = AppConfig(flavor: Flavor.DEV, aptabaseAppKey: 'test');
      appLogger = AppLogger(config: config, logger: mockLogger);

      appLogger.i('info message');

      verify(mockLogger.i('info message')).called(1);
    });

    test('should log warning message', () {
      final config = AppConfig(flavor: Flavor.DEV, aptabaseAppKey: 'test');
      appLogger = AppLogger(config: config, logger: mockLogger);

      appLogger.w('warning message');

      verify(mockLogger.w('warning message')).called(1);
    });

    test('should log error message', () {
      final config = AppConfig(flavor: Flavor.DEV, aptabaseAppKey: 'test');
      appLogger = AppLogger(config: config, logger: mockLogger);

      appLogger.e('error message');

      verify(mockLogger.e('error message')).called(1);
    });
  });
}
