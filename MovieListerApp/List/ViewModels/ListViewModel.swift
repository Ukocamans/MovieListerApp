//
//  ListViewModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ListViewModel {
    var datasource: [ListItemCellViewModel] = []
    typealias requestFinished = (()->(Void))?
    
    var reqModel: SearchRequestModel = SearchRequestModel()
    var isBusy = false
    
    let reloadData: BehaviorRelay<Void> = BehaviorRelay<Void>(value: ())
    let disposeBag = DisposeBag()
    
    func searchRequest(reset: Bool = false, completion: requestFinished = nil ) {
        guard !isBusy else { return }
        if reset {
            reqModel.page = 0
            datasource = []
        }
        isBusy = true
        let request = SearchRequest()
        reqModel.page += 1
        request.send(reqModel: reqModel) { [weak self] (model, error) in
            completion?()
            self?.isBusy = false
            if error == nil {
                self?.datasource +=  model?.search.map({ (model) -> ListItemCellViewModel in
                    return ListItemCellViewModel(model: model)
                }) ?? []
                self?.reloadData.accept(())
            } else {
                print(error)
            }
        }
    }
}
