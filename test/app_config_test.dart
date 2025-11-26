import 'package:flutter_test/flutter_test.dart';
import 'package:my_logger_metrics/src/config/app_config.dart';
import 'package:logger/logger.dart';
import 'package:my_logger_metrics/flavor.dart';

void main() {
  group('AppConfig Tests', () {
    test('should return correct log level for DEV flavor', () {
      final config = AppConfig(flavor: Flavor.DEV, aptabaseAppKey: 'test_key');
      expect(config.logLevel, Level.debug);
    });

    test('should return correct log level for STAGING flavor', () {
      final config = AppConfig(
        flavor: Flavor.STAGING,
        aptabaseAppKey: 'test_key',
      );
      expect(config.logLevel, Level.info);
    });

    test('should return correct log level for PROD flavor', () {
      final config = AppConfig(flavor: Flavor.PROD, aptabaseAppKey: 'test_key');
      expect(config.logLevel, Level.error);
    });

    test('should return correct log level for TEST flavor', () {
      final config = AppConfig(flavor: Flavor.TEST, aptabaseAppKey: 'test_key');
      expect(config.logLevel, Level.trace);
    });

    test('should store aptabaseAppKey correctly', () {
      final config = AppConfig(
        flavor: Flavor.DEV,
        aptabaseAppKey: 'my_secret_key',
      );
      expect(config.aptabaseAppKey, 'my_secret_key');
    });

    test('should allow null aptabaseAppKey', () {
      final config = AppConfig(flavor: Flavor.DEV);
      expect(config.aptabaseAppKey, isNull);
    });
  });
}
