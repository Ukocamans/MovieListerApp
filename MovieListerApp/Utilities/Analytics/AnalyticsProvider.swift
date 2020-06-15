//
//  AnalyticsProvider.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 15.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation
import UIKit

protocol AnalyticsProvider {

    func initialize(launchOptions: [UIApplication.LaunchOptionsKey: Any]?)

    func track(event: AnalyticsEvent)

    func canTrack(event: AnalyticsEvent) -> Bool

}
