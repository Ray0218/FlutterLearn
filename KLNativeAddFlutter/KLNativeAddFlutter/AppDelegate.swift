//
//  AppDelegate.swift
//  KLNativeAddFlutter
//
//  Created by WKL on 2021/3/31.
//

import UIKit
import Flutter
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?
    
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        flutterEngine.run()
        
        
        return true
    }

  


}

