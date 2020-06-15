//
//  ListItemCellViewModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

class ListItemCellViewModel {
    var id: String = ""
    var title: String = ""
    var type: String = ""
    var year: String = ""
    
    init(model: SearchModel) {
        id = model.imdbID
        title = model.title
        type = model.type
        year = model.year
    }
}
