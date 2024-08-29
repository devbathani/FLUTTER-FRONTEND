package com.example.method_channel_function

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.addition"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "add") {
                val a = call.argument<Int>("a")
                val b = call.argument<Int>("b")
                if (a != null && b != null) {
                    result.success(a + b)
                } else {
                    result.error("INVALID_ARGUMENT", "Arguments are null", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
