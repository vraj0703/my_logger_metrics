
import 'my_logger_metrics_platform_interface.dart';

class MyLoggerMetrics {
  Future<String?> getPlatformVersion() {
    return MyLoggerMetricsPlatform.instance.getPlatformVersion();
  }
}
