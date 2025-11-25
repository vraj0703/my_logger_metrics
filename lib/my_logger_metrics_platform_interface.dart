import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_logger_metrics_method_channel.dart';

abstract class MyLoggerMetricsPlatform extends PlatformInterface {
  /// Constructs a MyLoggerMetricsPlatform.
  MyLoggerMetricsPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyLoggerMetricsPlatform _instance = MethodChannelMyLoggerMetrics();

  /// The default instance of [MyLoggerMetricsPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyLoggerMetrics].
  static MyLoggerMetricsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyLoggerMetricsPlatform] when
  /// they register themselves.
  static set instance(MyLoggerMetricsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
