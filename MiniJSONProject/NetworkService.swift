//
//  NetworkService.swift
//  MiniJSONProject
//
//  Created by Илья Десятов on 26.02.2024.
//

import Foundation

final class NetworkService {
    static var sharedObj = NetworkService()
    
   private let urlEntries = "https://api.publicapis.org/entries"
   private let session = URLSession.init(configuration: .default)
    
     func getQuotes(one: @escaping([EntryDates]) -> Void) {
        
        let task = session.dataTask(with: URLRequest(url: URL(string: urlEntries)!)) { ( data, response, error) in
            DispatchQueue.main.async {
                if let data {
                    do {
                        let decodeData = try JSONDecoder().decode(MainJsonProperies.self, from: data)
                        one(decodeData.entries)
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        task.resume()
    }
}
