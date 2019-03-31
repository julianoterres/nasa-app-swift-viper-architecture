//
//  AppDelegate.swift
//  NasaPhotos
//
//  Created by Juliano Terres on 27/03/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.initMainScreen()
    return true
  }
  
  func initMainScreen() {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window  {
      let viewControllerMain = PhotoListRouter().build()
      let navigationController = UINavigationController()
      navigationController.viewControllers = [viewControllerMain]
      window.rootViewController = navigationController
      window.makeKeyAndVisible()
    }
  }
  
}

