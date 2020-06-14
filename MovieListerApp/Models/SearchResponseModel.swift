//
//  SearchResponseModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

class SearchResponseModel: BaseModel {
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
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        search = try container.decodeIfPresent([SearchModel].self, forKey: .search) ?? []
        error = try container.decodeIfPresent(String.self, forKey: .error) ?? ""
        response = try container.decodeIfPresent(String.self, forKey: .response) ?? ""
        totalResults = try container.decodeIfPresent(String.self, forKey: .totalResults) ?? ""
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(search, forKey: .search)
        try container.encodeIfPresent(error, forKey: .error)
        try container.encodeIfPresent(response, forKey: .response)
        try container.encodeIfPresent(totalResults, forKey: .totalResults)
        try super.encode(to: encoder)
    }
}

class SearchModel: BaseModel {
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
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        year = try container.decodeIfPresent(String.self, forKey: .year) ?? ""
        imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        poster = try container.decodeIfPresent(String.self, forKey: .poster) ?? ""
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(year, forKey: .year)
        try container.encodeIfPresent(imdbID, forKey: .imdbID)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(poster, forKey: .poster)
        try super.encode(to: encoder)
    }
}
