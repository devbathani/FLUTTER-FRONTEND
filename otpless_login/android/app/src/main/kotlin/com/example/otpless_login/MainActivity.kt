package com.example.otpless_login

import io.flutter.embedding.android.FlutterActivity
import com.example.otpless_flutter.OtplessFlutterPlugin


class MainActivity: FlutterActivity() {
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
super.onActivityResult(requestCode, resultCode, data)
val plugin = flutterEngine?.plugins?.get(OtplessFlutterPlugin::class.java)
if (plugin is OtplessFlutterPlugin) {
plugin.onActivityResult(requestCode, resultCode, data)
}
}
}
