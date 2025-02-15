//
//  WikipediaManager.swift
//  API Practice
//
//  Created by Harshit ‎ on 1/14/25.
//

import Foundation

struct WikipediaManager {
    let wikiURL = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=barberton%20daisy&indexpageids&redirects=1"
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                if let safeData = data {
                    self.parseJSON(safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ wikiData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WikiData.self, from: wikiData)
            let pageID = decodedData.query.pageids
            print(pageID[0])
            print(decodedData.query.pages["1276123"]!.extract)
//            print(decodedData.query.pages["1276123"]?.extract ?? "No extract found")

        } catch {
            print(error)
        }
    }
}

struct WikiData: Codable {
    let query: Query
}

struct Query: Codable {
    let pageids: [String]
    let pages: [String: Page]
}

struct Page: Codable {
    let extract: String
}
