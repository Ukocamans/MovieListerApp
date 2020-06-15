//
//  SplashViewModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SplashViewModel {
    
    let remoteConfigManager = FirebaseRemoteConfigManager.shared
    let title: BehaviorRelay<String?> = BehaviorRelay<String?>(value: nil)
    
    let disposeBag = DisposeBag()
    
    func fetchRemoteConfig() {
        
        if !Connectivity.checkInternet() {
            AlertManager.shared.showAlert(title: "Error", message: "Please check your internet connection")
            return
        }
        
        remoteConfigManager.fetchRemoteConfig { [weak self] (isSuccess) in
            if isSuccess {
                self?.title.accept(self?.remoteConfigManager.config?.splashTitle)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
                    UIApplication.shared.keyWindow?.rootViewController = viewController
                }
            } else {
                
            }
        }
    }
}
