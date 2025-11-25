#include "include/my_logger_metrics/my_logger_metrics_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "my_logger_metrics_plugin.h"

void MyLoggerMetricsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  my_logger_metrics::MyLoggerMetricsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
