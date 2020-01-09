//
//  NewsCellView.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//

import Foundation
import SwiftUI

struct NewsCellView: View {
    
    var news:News
    
    var body: some View {
        HStack{
            VStack{
                Text(news.title).bold().multilineTextAlignment(.center)
                
                if news.author != "" {
                    HStack{
                        Text("Источник:").font(.body).bold().multilineTextAlignment(.leading)
                        Spacer()
                        Text(news.author)
                            .font(.body)
                            .multilineTextAlignment(.trailing)
                    }.padding(.top)
                }
            }
        }
    }
    
}

struct NewsCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCellView(news: News(
            title: "Тема новости", author: "Автор новости", description: "Сама новость Today brings us what will hopefully be the final update about the state of Jets quarterback Sam Darnold’s spleen, which was thrust into a precarious position by the mononucleosis virus that has kept him out of action since Week 2. We are pleased to pass along", url: "https://newsapi.org/docs/endpoints/top-headlines"
        ))
    }
}

