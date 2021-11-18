//
//  AppDelegate.swift
//  swift-protocol-example
//
//  Created by Bruce on 2021/11/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = TabController()
    window?.makeKeyAndVisible()
    
    return true
  }


}

