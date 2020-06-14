//
//  SplashViewModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

class SplashViewModel {
    
    let remoteConfigManager = FirebaseRemoteConfigManager.shared
    
    func fetchRemoteConfig() {
        remoteConfigManager.fetchRemoteConfig()
    }
}
