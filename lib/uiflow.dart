
import 'uiflow_platform_interface.dart';

class Uiflow {
  Future<String?> getPlatformVersion() {
    return UiflowPlatform.instance.getPlatformVersion();
  }
}
