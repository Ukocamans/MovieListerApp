//
//  DetailViewModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 15.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class DetailViewModel {
    let title: BehaviorRelay<String?> = BehaviorRelay<String?>(value: nil)
    let imageURL: BehaviorRelay<String?> = BehaviorRelay<String?>(value: nil)
    let genre: BehaviorRelay<String?> = BehaviorRelay<String?>(value: nil)
    let plot: BehaviorRelay<String?> = BehaviorRelay<String?>(value: nil)
    
    var imdbId: String = ""
    
    let disposeBag = DisposeBag()
    
    func getDetail() {
        let request = DetailRequest()
        let requestModel = DetailRequestModel()
        requestModel.imdbId = imdbId
        request.send(reqModel: requestModel) { [weak self] (model, error) in
            if error == nil {
                self?.configure(with: model)
            } else {
                
            }
        }
    }
    
    func configure(with model: DetailResponseModel?) {
        title.accept(model?.title)
        imageURL.accept(model?.poster)
        genre.accept(model?.genre)
        plot.accept(model?.plot)
        AnalyticsManager.shared.track(event: .viewItem(id: imdbId, name: title.value ?? "", category: genre.value ?? ""))
    }
}
