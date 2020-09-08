package com.example.flutter_application

import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val TAG: String = javaClass.simpleName;

    private val CHANNEL: String = "com.example.flutter_application/flutter_to_native_sample";

    private lateinit var channel: MethodChannel

    override fun onPause() {
        super.onPause()
        Log.d(TAG, "onPause called.")
        channel.invokeMethod("onActivityChangedFromNative", "onPause", object : MethodChannel.Result {
            override fun success(result: Any?) {
                val resultStr = result as String
                Log.d(TAG, "onActivityChangedFromNative(onPause) success. /result:$resultStr")
            }

            override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
                Log.d(TAG, "onActivityChangedFromNative(onPause) error. /errorCode:$errorCode, /errorMessage:$errorMessage, /errorDetails:$errorDetails")
            }

            override fun notImplemented() {
                Log.d(TAG, "onActivityChangedFromNative(onPause) notImplemented")
            }
        })
    }

    override fun onResume() {
        super.onResume()
        Log.d(TAG, "onResume called.")
        channel.invokeMethod("onActivityChangedFromNative", "onResume", object : MethodChannel.Result {
            override fun success(result: Any?) {
                Log.d(TAG, "onActivityChangedFromNative(onResume) success. /result:$result")
            }

            override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
                Log.d(TAG, "onActivityChangedFromNative(onResume) error. /errorCode:$errorCode, /errorMessage:$errorMessage, /errorDetails:$errorDetails")
            }

            override fun notImplemented() {
                Log.d(TAG, "onActivityChangedFromNative(onResume) notImplemented")
            }
        })
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
            when (methodCall.method) {
                "voidMethodNoParam" -> {
                    result.success(null)
                    Log.i(TAG, "voidMethodNoParam() finished.")
                }
                "getIntMethodNoParam" -> {
                    val ret = 1234;
                    result.success(ret)
                    Log.i(TAG, "getIntMethodNoParam() finished. /ret:$ret")
                }
                "getStringMethodParamsInt" -> {
                    val inputParam = methodCall.arguments<Int>() as Int
                    val ret = "ABC"
                    result.success(ret)
                    Log.i(TAG, "getStringMethodParamsInt() finished. /inputParam:$inputParam /ret:$ret")
                }
                "getIntArrayMethodParamsStringInt" -> {
                    val param1 = methodCall.argument<String>("param1").toString()
                    val param2 = methodCall.argument<Int>("param2") as Int
                    val ret = listOf(300, 400, 500)
                    result.success(ret)
                    Log.i(TAG, "getStringMethodParamsInt() finished. /inputParam1:$param1  /inputParam2:$param2 /ret:$ret")
                }
                "getMapMethodNoParams" -> {
                    val ret = mapOf<String, Any>(
                            "ret1" to 1234,
                            "ret2" to "ABCD")
                    result.success(ret)
                    Log.i(TAG, "getMapMethodNoParams() finished. /ret:$ret")
                }
                else -> result.notImplemented()
            }
        }
    }
}