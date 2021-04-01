import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    
    
    let register: FlutterPluginRegistrar = self.registrar(forPlugin: "tplugin")!
    
    let fac = KLFlutterViewFactory(messenger:register.messenger())
    
    
    register.register(fac, withId: "platform_view")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


 
