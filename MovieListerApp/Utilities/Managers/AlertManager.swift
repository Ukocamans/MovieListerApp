//
//  AlertManager.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import UIKit
import RLBAlertsPickers

class AlertManager{
    
    static let shared = AlertManager()
    
    func showAlert(title: String?, message: String?) {
        
        let alert = UIAlertController(title: title ?? "",
                                      message: message ?? "",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        
        presentAlert(alert: alert)
    }
    
    func presentAlert(alert: UIViewController, animated: Bool = true) {
        var vc = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController
        
        if vc?.presentedViewController != nil {
            vc = vc?.presentedViewController
        } else if vc?.presentingViewController != nil{
            vc = vc?.presentingViewController
        }
        vc?.present(alert, animated: animated)
    }
    
    func alertPicker(pickerViewValues: [[String]],completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addPickerView(values: pickerViewValues) { (vc, picker, index, values) in
            let str = values[index.column][index.row]
            completion(str)
        }
        
        let btnCancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(btnCancel)
        
        presentAlert(alert: alert)
    }
}
