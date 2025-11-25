import 'package:logger/logger.dart';
import 'package:my_logger_metrics/flavor.dart';

class AppConfig {
  final Flavor flavor;
  final String aptabaseAppKey;

  AppConfig({required this.flavor, required this.aptabaseAppKey});

  Level get logLevel {
    switch (flavor) {
      case Flavor.DEV:
        return Level.debug;
      case Flavor.TEST:
        return Level.trace;
      case Flavor.STAGING:
        return Level.info;
      case Flavor.PROD:
        return Level.error;
    }
  }
}
