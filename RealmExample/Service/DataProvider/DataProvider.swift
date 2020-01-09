//
//  DataProvider.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation
import RealmSwift


final public class DataProvider  {
    
    public static let shared = DataProvider()
    var actualNews: [News]?
    
    private var realm = try? Realm()
    private var complitionHandler: (_ news:[News]) ->() = { _ in }
    private var token: NotificationToken?
    private var newsModelArray: Results<NewsModel>? = nil{
           didSet{
               guard self.actualNews != nil else {return}
               self.actualNews!.removeAll()
               for news in newsModelArray!{
                   actualNews?.append(News(newsModel: news))
               }
               DispatchQueue.main.async {
                   self.complitionHandler(self.actualNews!)
               }
           }
       }
    
    private init() {
        actualNews = [News]()
        observerRealm()
    }
        
 
    private func updateActualNewsFromeCache(){
        DispatchQueue.main.async {
            guard let realm = try? Realm() else {return}
            self.newsModelArray = realm.objects(NewsModel.self)
        }
    }
    
        func getNews(complitionHandler: @escaping(_ news:[News])->()) {
           
            self.complitionHandler = complitionHandler
  
            DispatchQueue.global(qos: .utility).async {
                self.updateNewsFromeURL()
            }
        }

    func updateNews(){
         DispatchQueue.global(qos: .utility).async {
            self.updateNewsFromeURL()
        }
    }
    
        private func updateNewsFromeURL(){
            Request().getJsonNewsFromURL(){arrayNewsModel in
                DispatchQueue.main.async {
                do {
                    let result = self.realm?.objects(NewsModel.self)
                    guard (result != nil) else { return }
                    self.realm?.beginWrite()
                    self.realm?.delete(result!)
                    self.realm?.add(arrayNewsModel)
                    try self.realm?.commitWrite()
                } catch {
                    print(error.localizedDescription)
                }
            }
            }
        }

       private func observerRealm() {
            DispatchQueue.main.async {
                guard let realm = try? Realm() else {return}
                self.newsModelArray = realm.objects(NewsModel.self)
                self.token = self.newsModelArray?.observe { [weak self] ( changes: RealmCollectionChange) in
                    guard self != nil else {return}
                    switch changes {
                    case .initial:
                        self!.updateActualNewsFromeCache()
                    case .update(_, _, _, _):
                        self!.updateActualNewsFromeCache()
                    case .error(let error):
                        fatalError("\(error)")
                    }
                }
            }
        }

}
