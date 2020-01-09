//
//  ConfigURL.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation
enum ConfigURL {
    
    case getSources
    
    var scheme: String {
        switch self {
        case .getSources:
            return "https"
        }
    }
    
    var host: String {
        let base = "newsapi.org"
        switch self {
        case .getSources:
            return base
        }
    }
    
    var path: String {
        switch self {
        case .getSources:
            return "/v2/top-headlines"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getSources:
                        return [URLQueryItem(name: "country", value: "ru"),
                                URLQueryItem(name: "apiKey", value: "ffcf3615bbe24a18805af3af69eb0d5f")]

        }
    }
    
    var method: String {
        switch self {
        case .getSources:
            return "GET"
        }
    }
    
}
