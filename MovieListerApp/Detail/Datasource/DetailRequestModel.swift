//
//  DetailRequestModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 15.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

import Foundation

class DetailRequestModel: Codable {
    var imdbId: String = ""
    
    enum CodingKeys: String, CodingKey {
        case imdbId = "i"
    }
}
