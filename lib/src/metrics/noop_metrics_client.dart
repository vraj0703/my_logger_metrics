import 'package:my_logger_metrics/src/metrics/app_metrics.dart';

class NoOpMetricsClient implements MetricsClient {
  @override
  Future<void> trackEvent(
    String eventName, [
    Map<String, dynamic>? props,
  ]) async {
    // Do nothing
  }
}
