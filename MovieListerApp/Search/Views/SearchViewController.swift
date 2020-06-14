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
    
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRx()
    }
    
    func setupRx() {
        viewModel.type.bind(to: labelType.rx.text).disposed(by: viewModel.disposeBag)
        viewModel.year.bind(to: labelYear.rx.text).disposed(by: viewModel.disposeBag)
    }
    
    @IBAction func actionChooseType(_ sender: Any) {
        viewModel.chooseType()
    }
    
    @IBAction func actionChooseReleaseYear(_ sender: Any) {
        viewModel.chooseReleaseYear()
    }
    
    @IBAction func actionSearch(_ sender: Any) {
        let model = viewModel.search(text: textFieldTitle.text)
        performSegue(withIdentifier: "toList", sender: model)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let model = sender as? SearchRequestModel, let controller = segue.destination as? ListViewController {
            //TODO: give model to list view controller view Model
        }
    }
}
