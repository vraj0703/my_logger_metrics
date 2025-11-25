import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_logger_metrics_platform_interface.dart';

/// An implementation of [MyLoggerMetricsPlatform] that uses method channels.
class MethodChannelMyLoggerMetrics extends MyLoggerMetricsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_logger_metrics');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
