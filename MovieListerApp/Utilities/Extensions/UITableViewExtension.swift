//
//  UITableViewExtension.swift
//  CampaingPage
//
//  Created by Umurcan Kocaman on 18.12.2019.
//  Copyright © 2019 ukocaman. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerNib(name: String) {
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }
}
