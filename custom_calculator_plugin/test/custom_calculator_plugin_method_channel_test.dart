import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_calculator_plugin/custom_calculator_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCustomCalculatorPlugin platform = MethodChannelCustomCalculatorPlugin();
  const MethodChannel channel = MethodChannel('custom_calculator_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
