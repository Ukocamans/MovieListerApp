//
//  FirebaseRemoteConfigManager.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import Firebase

class FirebaseRemoteConfigManager {
    static let shared = FirebaseRemoteConfigManager()
    var remoteConfig: RemoteConfig!
    
    func configure() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    func fetchRemoteConfig() {
        remoteConfig.setDefaults(["app_title": "Bilyoner" as NSObject])
        remoteConfig.fetch(withExpirationDuration: 0) { [weak self] (status, error) in
            if status == .success {
                print("Config fetched!")
                self?.remoteConfig.activate(completion: { (status, error) in
                    print(error?.localizedDescription ?? "")
                })
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
    }
}
