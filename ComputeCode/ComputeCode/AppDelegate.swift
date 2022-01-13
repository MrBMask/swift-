//
//  AppDelegate.swift
//  ComputeCode
//
//  Created by 郝靓 on 2021/8/4.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController.init(rootViewController: ViewController.init())
        window?.makeKeyAndVisible()
        return true
    }

 

}

