//
//  BaseURL.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation
struct BaseURL {
    
    /* https://newsapi.org/v2/top-headlines?' +
    'country=us&' +
    'apiKey=ffcf3615bbe24a18805af3af69eb0d5f'
     */
    
    var urlComponents = URLComponents()
    let scheme = "https"
    let host = "www.gismeteo.ru"//"newsapi.org"
    let path = "/weather-novorossysk-5214"//"/v2/top-headlines"

//    let queryItem1 = URLQueryItem(name: "lat", value: "ru")
//    let queryItem2 = URLQueryItem(name: "lon", value: "ru")
//    let queryItem3 = URLQueryItem(name: "appid", value: "c2dcf8ffb5cdc3f8977bfd2ae7ea4738")
//    let queryItem4 = URLQueryItem(name: "units", value: "metric")
   
    mutating func urlConfigList() -> URL {
        urlComponents.scheme = self.scheme
        urlComponents.host = self.host
        urlComponents.path = self.path
        urlComponents.queryItems = []//[queryItem1,queryItem2,queryItem3,queryItem4]
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        return url
    }
}

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
