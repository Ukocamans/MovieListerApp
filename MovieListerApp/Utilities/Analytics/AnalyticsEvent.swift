//
//  AnalyticsEvent.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 15.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

enum AnalyticsEventType {

    case viewItem
}

enum AnalyticsEvent {
    
    case viewItem(id: String, name: String, category: String)

    var type: AnalyticsEventType {
        switch self {
        case .viewItem:
            return .viewItem
        }
    }
}
