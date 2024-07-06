import Flutter
import UIKit
import OtplessSDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
if Otpless.sharedInstance.isOtplessDeeplink(url: url){ 
Otpless.sharedInstance.processOtplessDeeplink(url: url)
	return true
}
	super.application(app, open: url, options: options)
	return true

}
}
