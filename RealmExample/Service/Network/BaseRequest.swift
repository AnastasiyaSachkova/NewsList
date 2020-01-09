//
//  BaseRequest.swift
//  RealmExample
//
//  Created by 7Winds on 09.01.2020.
//  Copyright © 2020 Anastasiya Sachkova #elisdev. All rights reserved.
//


import Foundation

class BaseRequest {
    
    let session = URLSession.shared
    
    func downloadTask(url: String, complition: @escaping (_ json: Any, _ data: Data) -> Void) {
        
        guard let url = URL(string: url) else { return print("ERROR") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let res = response as? HTTPURLResponse, (200...299).contains(res.statusCode) else {
                print("Server error!")
                return
            }
            
            let mi = res.mimeType
            guard let mime = res.mimeType, mime == "application/json" else {
                print("Wrong MIME type! \(String(describing: mi))")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                complition(json, data!)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
