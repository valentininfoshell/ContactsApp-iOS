//
//  AppDelegate.swift
//  Contacts
//
//  Created by Виталий Сероштанов on 02.12.2020.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = Assembly.startModule()
        window?.makeKeyAndVisible()
        return true
    }

}

