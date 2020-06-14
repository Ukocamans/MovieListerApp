//
//  SplashViewController.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    let viewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchRemoteConfig()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
//            UIApplication.shared.keyWindow?.rootViewController = viewController
//        }
        
    }
}
