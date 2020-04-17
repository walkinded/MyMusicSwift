//
//  NetworkService.swift
//  MyMusic
//
//  Created by Роман Лабунский on 25/02/2020.
//  Copyright © 2020 Роман Лабунский. All rights reserved.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        
         let theUrl = "https://itunes.apple.com/search"
        let parameters = ["term" : "\(searchText)",
                          "limit" : "10",
                          "media":"music"]
                           
        AF.request(theUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponce) in
               if let error = dataResponce.error {
                   print("Error requesting data: \(error.localizedDescription)")
                completion(nil)
                   return
               }
            
               guard let data = dataResponce.data else { return }
            
                let decoder = JSONDecoder()
               do {
                   let objects = try decoder.decode(SearchResponse.self, from: data)
                   print("objects", objects)
                completion(objects)
                   
               } catch let jsonError {
                completion(nil)
                   print("Failed to decode JSON", jsonError)
               }
              
               
//               let someString = String(data: data, encoding: .utf8)
//               print(someString ?? "")
           }
    }
}
