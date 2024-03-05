//
//  AppDelegate.swift
//  Paint
//
//  Created by Laryssa Castagnoli on 06/02/18.
//  Copyright © 2018 Laryssa Castagnoli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let coordinator = Coordinator()
        coordinator.start()
        self.coordinator = coordinator
        window.rootViewController = coordinator.navigationController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

