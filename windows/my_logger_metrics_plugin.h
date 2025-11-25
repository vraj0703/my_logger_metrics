#ifndef FLUTTER_PLUGIN_MY_LOGGER_METRICS_PLUGIN_H_
#define FLUTTER_PLUGIN_MY_LOGGER_METRICS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace my_logger_metrics {

class MyLoggerMetricsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MyLoggerMetricsPlugin();

  virtual ~MyLoggerMetricsPlugin();

  // Disallow copy and assign.
  MyLoggerMetricsPlugin(const MyLoggerMetricsPlugin&) = delete;
  MyLoggerMetricsPlugin& operator=(const MyLoggerMetricsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace my_logger_metrics

#endif  // FLUTTER_PLUGIN_MY_LOGGER_METRICS_PLUGIN_H_
