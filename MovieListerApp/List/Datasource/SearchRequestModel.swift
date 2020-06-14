//
//  ListRequestModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

class SearchRequestModel: Codable {
    var search: String = ""
    var type: String = ""
    var year: String = ""
    var page: Int = 1
    
    enum CodingKeys: String, CodingKey {
        case search = "s"
        case type
        case year = "y"
        case page
    }
}
