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

        setupRx()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchRemoteConfig()
    }
    
    func setupRx() {
        viewModel.title.bind(to: labelTitle.rx.text).disposed(by: viewModel.disposeBag)
    }
}
