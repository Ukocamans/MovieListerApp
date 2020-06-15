//
//  AppDelegate.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        AnalyticsManager.shared.initialize(launchOptions: launchOptions, providers: [FirebaseAnalyticsProvider(), LoodosAnalyticsProvider()])
        FirebaseRemoteConfigManager.shared.configure()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        return true
    }
}

