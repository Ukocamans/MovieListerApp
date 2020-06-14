//
//  UIViewExtension.swift
//  CoronaTracker
//
//  Created by Umurcan Kocaman on 28.03.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
}
