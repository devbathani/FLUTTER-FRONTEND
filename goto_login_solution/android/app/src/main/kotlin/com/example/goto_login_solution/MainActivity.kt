package com.example.goto_login_solution

import io.flutter.embedding.android.FlutterActivity

import com.otpless.otplessflutter.OtplessFlutterPlugin;
import android.content.Intent;

class MainActivity: FlutterActivity(){
override fun onNewIntent(intent: Intent) {
	super.onNewIntent(intent)
	val plugin = flutterEngine?.plugins?.get(OtplessFlutterPlugin::class.java)
	if (plugin is OtplessFlutterPlugin) {
		plugin.onNewIntent(intent)
	}
}
override fun onBackPressed() {
	val plugin = flutterEngine?.plugins?.get(OtplessFlutterPlugin::class.java)
	if (plugin is OtplessFlutterPlugin) {
		if (plugin.onBackPressed()) return
	}
	// handle other cases
	super.onBackPressed()
}
}
