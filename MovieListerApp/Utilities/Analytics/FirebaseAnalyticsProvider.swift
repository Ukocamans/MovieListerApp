//
//  FirebaseAnalyticsProvider.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 15.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

import Firebase

final class FirebaseAnalyticsProvider: AnalyticsProvider {
    func canTrack(event: AnalyticsEvent) -> Bool {
        return true
    }

    func initialize(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist") ?? ""
        if let options = FirebaseOptions(contentsOfFile: filePath) {
            FirebaseApp.configure(options: options)
        }
    }

    func track(event: AnalyticsEvent) {
        switch event {
        case .viewItem(let id, let name, let category):
            Analytics.logEvent(AnalyticsEventViewItem, parameters: [AnalyticsParameterItemID: id,
                                                      AnalyticsParameterItemName: name,
                                                      AnalyticsParameterItemCategory: category])
        }
    }
}
