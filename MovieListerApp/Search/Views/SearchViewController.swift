//
//  SearchViewController.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var labelPageTitle: UILabel!
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionChooseType(_ sender: Any) {
    }
    
    @IBAction func actionChooseReleaseYear(_ sender: Any) {
    }
    
    @IBAction func actionSearch(_ sender: Any) {
    }
}
