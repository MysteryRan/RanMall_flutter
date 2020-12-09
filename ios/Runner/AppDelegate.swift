import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    Basic.init().setUpHybird(window: self.window)
    
    Method.init().setUpHybird(window: self.window)
    
    Event.init().setUpHybird(window: self.window)
    
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
