//
//  SearchResponseModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

struct SearchResponseModel: Codable{
    var error: String = ""
    var search: [SearchModel] = []
    var totalResults: String = ""
    var response: String = ""
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
        case error = "Error"
    }
}

struct SearchModel: Codable {
    var title: String = ""
    var year: String = ""
    var imdbID: String = ""
    var type: String = ""
    var poster: String = ""
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
