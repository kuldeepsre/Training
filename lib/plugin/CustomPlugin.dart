import 'dart:async';

import 'package:flutter/services.dart';

class CustomCalculatorPlugin {
  static const MethodChannel _channel = MethodChannel('custom_calculator_plugin');

  static Future<int> add(int a, int b) async {
    final result = await _channel.invokeMethod('add', {'a': a, 'b': b});
    return result;
  }

  static Future<int> subtract(int a, int b) async {
    final result = await _channel.invokeMethod('subtract', {'a': a, 'b': b});
    return result;
  }

  static Future<int> multiply(int a, int b) async {
    final result = await _channel.invokeMethod('multiply', {'a': a, 'b': b});
    return result;
  }

  static Future<int> divide(int a, int b) async {
    final result = await _channel.invokeMethod('divide', {'a': a, 'b': b});
    return result;
  }
}