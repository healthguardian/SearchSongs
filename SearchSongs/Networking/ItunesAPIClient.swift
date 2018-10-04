//
//  ItunesAPIClient.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/4/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()
    
    func searchForArtists(withTerm term: String, completion: @escaping ([Artist], ItunesError?) -> Void) {
        let endpoint = Itunes.search(term: term, media: .music(entity: .musicArtist, attribute: .artistTerm))
        
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], error)
                    return
                }
                
                guard let results = json["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "JSON data doesn't contain results"))
                    return
                }
                
                let artists = results.flatMap { Artist(json: $0) }
                
                completion(artists, nil)
            }
        }
        
        task.resume()
    }
}
