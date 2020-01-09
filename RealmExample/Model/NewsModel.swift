//
//  NewsModel.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation
import RealmSwift

class NewsModel: Object {
    
    @objc dynamic var title: String?
    @objc dynamic var author: String?
    @objc dynamic var article: String?
    @objc dynamic var url: String?
    
    convenience required init(data: JSON) {
        self.init()
        self.title = data["title"].string
        self.author = data["author"].string
        self.article = data["description"].string
        self.url = data["url"].string
    }
}

struct News: Identifiable  {
    let id: Int
    let title: String
    let author: String
    let description: String
    let url: String
    
    init (newsModel: NewsModel ){
        id = Int.random(in: 0...100000)
        self.title = newsModel.title == nil ? "" : newsModel.title!
        self.author = newsModel.author == nil ? "" : newsModel.author!
        self.description = newsModel.article == nil ? "" : newsModel.article!
        self.url = newsModel.url == nil ? "" : newsModel.url!
    }
    
    init (title: String, author: String, description: String, url: String){
        self.id = 1
        self.title = title
        self.author = author
        self.description = description
        self.url = url
    }
}
