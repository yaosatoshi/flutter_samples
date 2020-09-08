import 'package:flutter/services.dart';

class FromNativeAPI {
  final MethodChannel _channel;

  FromNativeAPI(this._channel);

  void init() {
    _channel.setMethodCallHandler(_platformCallHandler);
  }

  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'onActivityChangedFromNative':
        {
          final String argument = call.arguments;
          print(
              "onActivityChangedFromNative called from Native. /arg:$argument");
          return "SUCCESS";
        }
        break;

      default:
        print("_platformCallHandler unknown method. /method:${call.method}");
        break;
    }
  }
}
