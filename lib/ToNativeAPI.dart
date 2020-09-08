import 'package:flutter/services.dart';

class ToNativeAPI {
  final _channel = const MethodChannel(
      "com.example.flutter_application/flutter_to_native_sample");

  Future<void> voidMethodNoParam() async {
    await _channel.invokeMethod<void>('voidMethodNoParam');
  }

  Future<int> getIntMethodNoParam() async {
    return await _channel.invokeMethod<int>('getIntMethodNoParam');
  }

  Future<String> getStringMethodParamsInt(int param1) async {
    return await _channel.invokeMethod<String>('getStringMethodParamsInt', param1);
  }

  Future<List<int>> getIntArrayMethodParamsStringInt(
      String param1, int param2) async {
    final Map param = <String, dynamic>{'param1': param1, 'param2': param2};
    return await _channel.invokeListMethod<int>(
        'getIntArrayMethodParamsStringInt', param);
  }

  Future<Map<String, dynamic>> getMapMethodNoParams() async {
    return await _channel.invokeMapMethod<String, dynamic>('getMapMethodNoParams');
  }
}
