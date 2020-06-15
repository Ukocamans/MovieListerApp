//
//  BaseModel.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

class BaseModel: Codable {
    init() {}
}

class BaseResponseModel: BaseModel {
    var error: String = ""
    var response: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case error = "Error"
    }
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let responseString = try container.decodeIfPresent(String.self, forKey: .response) ?? ""
        if responseString == "True" {
            response = true
        } else {
            response = false
        }
        error = try container.decodeIfPresent(String.self, forKey: .error) ?? ""
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(response, forKey: .response)
        try container.encodeIfPresent(error, forKey: .error)
        try super.encode(to: encoder)
    }
}
