//
//  ListRequest.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

class SearchRequest: NetworkRequest<SearchResponseModel,SearchRequestModel> {
    override init() {
        super.init()
        self.endpoint = ""
        self.httpMethod = .get
        self.showLoading = true
    }
}
