import 'package:flutter_test/flutter_test.dart';
import 'package:my_logger_metrics/my_logger_metrics.dart';
import 'package:my_logger_metrics/my_logger_metrics_platform_interface.dart';
import 'package:my_logger_metrics/my_logger_metrics_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyLoggerMetricsPlatform
    with MockPlatformInterfaceMixin
    implements MyLoggerMetricsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MyLoggerMetricsPlatform initialPlatform = MyLoggerMetricsPlatform.instance;

  test('$MethodChannelMyLoggerMetrics is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyLoggerMetrics>());
  });

  test('getPlatformVersion', () async {
    MyLoggerMetrics myLoggerMetricsPlugin = MyLoggerMetrics();
    MockMyLoggerMetricsPlatform fakePlatform = MockMyLoggerMetricsPlatform();
    MyLoggerMetricsPlatform.instance = fakePlatform;

    expect(await myLoggerMetricsPlugin.getPlatformVersion(), '42');
  });
}
