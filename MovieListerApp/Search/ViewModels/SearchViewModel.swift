//
//  SearchViewModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class SearchViewModel {
    
    var searchText: String = ""
    var type: BehaviorRelay<String> = BehaviorRelay<String>(value: "Choose Type")
    var year: BehaviorRelay<String> = BehaviorRelay<String>(value: "Choose Year")
    
    var selectedType: String = ""
    var selectedYear: String = ""
    
    let disposeBag = DisposeBag()
    
    
    func chooseType() {
        let types = FirebaseRemoteConfigManager.shared.config?.types ?? []
        let pickerViewValues: [[String]] = [types.map { $0 }]
        
        AlertManager.shared.alertPicker(pickerViewValues: pickerViewValues) { [weak self] (value) in
            self?.type.accept(value)
            self?.selectedType = value.AlltoEmpty().lowercased()
        }
    }
    
    func chooseReleaseYear() {
        let config = FirebaseRemoteConfigManager.shared.config
        
        let years: [String] = ((config?.startYear ?? 0)...(config?.endYear ?? 0)).map {
            if $0 == 1959 {
                return "All"
            }
            return String($0)
        }
        let pickerViewValues: [[String]] = [years.map { $0 }]
        AlertManager.shared.alertPicker(pickerViewValues: pickerViewValues) { [weak self] (value) in
            self?.year.accept(value)
            self?.selectedYear = value.AlltoEmpty()
        }
    }
    
    func search(text: String?) -> SearchRequestModel? {
        if text?.count ?? 0 > 2 {
            let reqModel = SearchRequestModel()
            reqModel.page = 1
            reqModel.year = selectedYear
            reqModel.type = selectedType
            reqModel.search = text ?? ""
            return reqModel
        } else {
            return nil
        }
    }
}
