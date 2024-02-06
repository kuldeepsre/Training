import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'custom_calculator_plugin_method_channel.dart';

abstract class CustomCalculatorPluginPlatform extends PlatformInterface {
  /// Constructs a CustomCalculatorPluginPlatform.
  CustomCalculatorPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static CustomCalculatorPluginPlatform _instance = MethodChannelCustomCalculatorPlugin();

  /// The default instance of [CustomCalculatorPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelCustomCalculatorPlugin].
  static CustomCalculatorPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CustomCalculatorPluginPlatform] when
  /// they register themselves.
  static set instance(CustomCalculatorPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
