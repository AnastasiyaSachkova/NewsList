//
//  NewsView.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation
import SwiftUI

struct NewsView: View {
    var news: News
    var body: some View {
        NavigationView {
            VStack{
                Text(news.title).fontWeight(.medium).bold().multilineTextAlignment(.center).font(.title)
                
                if news.author != "" {
                    HStack{
                        Text("Источник: ").bold().padding(.leading)
                        Spacer()
                        Text(news.author)
                    }.padding()
                }
                Text(news.description).multilineTextAlignment(.leading).padding()
                Button(action: {
                    if let url = URL(string: self.news.url) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("Открыть в Safari")
                }
            }
            
        }.navigationBarBackButtonHidden(false)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(news: News(
            title: "Тема новости", author: "Автор новости", description: "Сама новость Today brings us what will hopefully be the final update about the state of Jets quarterback Sam Darnold’s spleen, which was thrust into a precarious position by the mononucleosis virus that has kept him out of action since Week 2. We are pleased to pass along", url: "https://newsapi.org/docs/endpoints/top-headlines"
        ))
    }
}
