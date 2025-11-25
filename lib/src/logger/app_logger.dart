import 'package:logger/logger.dart';
import 'package:my_logger_metrics/src/config/app_config.dart';

class AppLogger {
  final AppConfig config;
  final Logger _logger;

  AppLogger({required this.config, Logger? logger})
    : _logger =
          logger ?? Logger(level: config.logLevel, printer: PrettyPrinter());

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
