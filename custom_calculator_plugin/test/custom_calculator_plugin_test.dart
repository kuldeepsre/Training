import 'package:flutter_test/flutter_test.dart';
import 'package:custom_calculator_plugin/custom_calculator_plugin.dart';
import 'package:custom_calculator_plugin/custom_calculator_plugin_platform_interface.dart';
import 'package:custom_calculator_plugin/custom_calculator_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCustomCalculatorPluginPlatform
    with MockPlatformInterfaceMixin
    implements CustomCalculatorPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CustomCalculatorPluginPlatform initialPlatform = CustomCalculatorPluginPlatform.instance;

  test('$MethodChannelCustomCalculatorPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCustomCalculatorPlugin>());
  });

  test('getPlatformVersion', () async {
    CustomCalculatorPlugin customCalculatorPlugin = CustomCalculatorPlugin();
    MockCustomCalculatorPluginPlatform fakePlatform = MockCustomCalculatorPluginPlatform();
    CustomCalculatorPluginPlatform.instance = fakePlatform;

    expect(await customCalculatorPlugin.getPlatformVersion(), '42');
  });
}
