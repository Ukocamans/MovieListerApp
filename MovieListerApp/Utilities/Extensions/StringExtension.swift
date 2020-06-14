//
//  StringExtension.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import Foundation

extension String {
    func AlltoEmpty() -> String {
        if self == "All" {
            return ""
        }
        return self
    }
    
    func EmptytoAll() -> String {
        if self == "" {
            return "All"
        }
        return self
    }
}
