import 'package:aptabase_flutter/aptabase_flutter.dart';
import 'package:my_logger_metrics/src/metrics/app_metrics.dart';

class AptabaseMetricsClient implements MetricsClient {
  final String appKey;

  AptabaseMetricsClient({required this.appKey});

  Future<void> init() async {
    await Aptabase.init(appKey);
  }

  @override
  Future<void> trackEvent(
    String eventName, [
    Map<String, dynamic>? props,
  ]) async {
    await Aptabase.instance.trackEvent(eventName, props);
  }
}
