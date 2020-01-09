//
//  NewsListView.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    

    @EnvironmentObject var news: NewsDataObject
    
    var body: some View {
        NavigationView {
             VStack{
                VStack{
                    List(news.newsArray, id: \.id) { news in
                        
                        NavigationLink(destination: NewsView(news: news)) {
                                    NewsCellView(news: news)
                                   }
                           }
                }
                
                }.navigationBarItems(trailing: ButtomView()).navigationBarTitle(Text("НОВОСТИ").bold(),  displayMode: .inline)
        }
    }
}

struct ButtomView: View {

    private var dataProvider = DataProvider.shared
    
var body: some View {
    Button(action: {
        self.dataProvider.updateNews()
    }) {
        Text("Обновить")
    }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            NewsCellView(news: News(
            title: "Тема новости", author: "Автор новости", description: "Сама новость Today brings us what will hopefully be the final update about the state of Jets quarterback Sam Darnold’s spleen, which was thrust into a precarious position by the mononucleosis virus that has kept him out of action since Week 2. We are pleased to pass along", url: "https://newsapi.org/docs/endpoints/top-headlines"
            ))
            
            NewsCellView(news: News(
            title: "Тема новости", author: "Автор новости", description: "Сама новость Today brings us what will hopefully be the final update about the state of Jets quarterback Sam Darnold’s spleen, which was thrust into a precarious position by the mononucleosis virus that has kept him out of action since Week 2. We are pleased to pass along", url: "https://newsapi.org/docs/endpoints/top-headlines"
            ))
            
        }
    }
}
