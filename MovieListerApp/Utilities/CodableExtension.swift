//
//  CodableExtension.swift
//  CampaingPage
//
//  Created by Umurcan Kocaman on 18.12.2019.
//  Copyright © 2019 ukocaman. All rights reserved.
//

import Foundation

import Foundation

extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var convertData: Data {
        return try! JSONEncoder().encode(self)
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: convertData)) as? [String: Any] ?? [:]
    }
}
