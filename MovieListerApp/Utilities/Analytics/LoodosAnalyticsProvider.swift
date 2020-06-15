//
//  LoodosAnalyticsProvider.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 15.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import UIKit

final class LoodosAnalyticsProvider: AnalyticsProvider {
    func canTrack(event: AnalyticsEvent) -> Bool {
        return true
    }

    func initialize(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        print("Loodos analytics provider initialized")
    }

    func track(event: AnalyticsEvent) {
        switch event {
        case .viewItem(let id, let name, let category):
            print("view item logged: with id: \(id) name: \(name) category: \(category)")
            
        }
    }
}
