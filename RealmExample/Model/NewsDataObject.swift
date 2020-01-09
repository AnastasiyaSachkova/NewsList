//
//  NewsDataObject.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation
import RealmSwift
import Combine

final class NewsDataObject: ObservableObject{
    
    fileprivate let dataProvider: DataProvider = DataProvider.shared
    
    @Published var newsArray:[News]
    
    init() {
        newsArray = [News]()
    }
    
    func startUpdating(){
        dataProvider.getNews(){
            newsFromeCache in
            self.newsArray = newsFromeCache
        }
    }
    
}
