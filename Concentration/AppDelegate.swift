//
//  AppDelegate.swift
//  Concentration
//
//  Created by Ricky on 3/13/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let viewController = ConcentrationViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

