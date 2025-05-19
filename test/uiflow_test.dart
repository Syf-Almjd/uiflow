import 'package:flutter_test/flutter_test.dart';
import 'package:uiflow/uiflow.dart';
import 'package:uiflow/uiflow_platform_interface.dart';
import 'package:uiflow/uiflow_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUiflowPlatform
    with MockPlatformInterfaceMixin
    implements UiflowPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final UiflowPlatform initialPlatform = UiflowPlatform.instance;

  test('$MethodChannelUiflow is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUiflow>());
  });

  test('getPlatformVersion', () async {
    Uiflow uiflowPlugin = Uiflow();
    MockUiflowPlatform fakePlatform = MockUiflowPlatform();
    UiflowPlatform.instance = fakePlatform;

    expect(await uiflowPlugin.getPlatformVersion(), '42');
  });
}
