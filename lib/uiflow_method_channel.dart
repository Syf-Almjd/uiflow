import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'uiflow_platform_interface.dart';

/// An implementation of [UiflowPlatform] that uses method channels.
class MethodChannelUiflow extends UiflowPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('uiflow');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
