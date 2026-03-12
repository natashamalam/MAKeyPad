//
//  AppDelegate.swift
//  LockScreen
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2026/03/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = KeyPadViewController(nibName: nil, bundle: nil)
        window?.makeKeyAndVisible()
        return true
    }

}

