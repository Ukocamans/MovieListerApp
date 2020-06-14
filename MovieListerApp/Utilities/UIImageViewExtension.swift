//
//  UIImageViewExtension.swift
//  CampaingPage
//
//  Created by Umurcan Kocaman on 18.12.2019.
//  Copyright © 2019 ukocaman. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(with url: String?, placeholder: String = "") {
        guard let url = URL(string: url ?? "") else { return }
        let placeholderImage = UIImage(named: placeholder)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: placeholderImage)
    }
}
