#include "include/uiflow/uiflow_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "uiflow_plugin.h"

void UiflowPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  uiflow::UiflowPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
