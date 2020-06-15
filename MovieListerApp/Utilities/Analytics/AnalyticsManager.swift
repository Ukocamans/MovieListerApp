//
//  AnalyticsManager.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 15.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import UIKit

class AnalyticsManager {

    static let shared = AnalyticsManager()

    private var providers: [AnalyticsProvider] = []

    init() {

    }

    func initialize(launchOptions: [UIApplication.LaunchOptionsKey: Any]?, providers: [AnalyticsProvider]) {
        self.providers = providers
        self.providers.forEach {
            $0.initialize(launchOptions: launchOptions)
        }
    }

    func track(event: AnalyticsEvent) {
        providers.forEach {
            if $0.canTrack(event: event) {
                $0.track(event: event)
            }
        }
    }
}
