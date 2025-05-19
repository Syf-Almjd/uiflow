import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'uiflow_method_channel.dart';

abstract class UiflowPlatform extends PlatformInterface {
  /// Constructs a UiflowPlatform.
  UiflowPlatform() : super(token: _token);

  static final Object _token = Object();

  static UiflowPlatform _instance = MethodChannelUiflow();

  /// The default instance of [UiflowPlatform] to use.
  ///
  /// Defaults to [MethodChannelUiflow].
  static UiflowPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UiflowPlatform] when
  /// they register themselves.
  static set instance(UiflowPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
