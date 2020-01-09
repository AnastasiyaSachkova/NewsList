//
//  Request.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation
class Request {

    let request = BaseRequest()
    var baseUrl = BaseURL()
    
    func getJsonNewsFromURL(complitionHendler: @escaping(_ newsArray: [NewsModel])->()) {
        let url = baseUrl.urlConfigList()
        self.request.downloadTask(url: url.absoluteString) {(json, _)  in
            let dJson = JSON(json)
            let array = dJson["articles"].array
         
            var mNews:[NewsModel] = [NewsModel]()
            if (array != nil) {
                
                for newsJSON in array! {
                    mNews.append(NewsModel(data: newsJSON))
                }
                complitionHendler(mNews)
            }
        }
    }
}

