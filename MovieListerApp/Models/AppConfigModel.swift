//
//  AppConfigModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

struct AppConfigModel: Codable {
    var splashTitle: String = ""
    var types: [String] = []
    var startYear: Int = 0
    var endYear: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case splashTitle = "splash_title"
        case types
        case startYear = "start_year"
        case endYear = "end_year"
    }
}
