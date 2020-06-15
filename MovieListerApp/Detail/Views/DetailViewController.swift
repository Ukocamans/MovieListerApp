//
//  DetailViewController.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelPlot: UILabel!
    
    let viewModel: DetailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRx()
        viewModel.getDetail()
    }
    
    func setupRx() {
        viewModel.title.bind(to: labelTitle.rx.text).disposed(by: viewModel.disposeBag)
        viewModel.genre.bind(to: labelGenre.rx.text).disposed(by: viewModel.disposeBag)
        viewModel.plot.bind(to: labelPlot.rx.text).disposed(by: viewModel.disposeBag)
        
        viewModel.imageURL.subscribe(onNext: { [weak self] (url) in
            self?.imageViewPoster.loadImage(with: url)
        }).disposed(by: viewModel.disposeBag)
    }
}
