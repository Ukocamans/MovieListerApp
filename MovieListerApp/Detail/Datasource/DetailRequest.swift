//
//  DetailRequest.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 15.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

class DetailRequest: NetworkRequest<DetailResponseModel,DetailRequestModel> {
    override init() {
        super.init()
        self.endpoint = ""
        self.httpMethod = .get
        self.showLoading = true
    }
}
