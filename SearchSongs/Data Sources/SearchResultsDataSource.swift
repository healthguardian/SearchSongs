//
//  SearchResultsDataSource.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/3/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//

import UIKit

// NSObject Protocol
// We need to satisfy the constraints of the NSObject protocol, which basically states that the object needs to be an Objective-C class.

class SearchResultsDataSource: NSObject, UITableViewDataSource {
    
    private var data = [Artist]()
    
    override init() {
        super.init()
    }

    func update(with artists: [Artist]) {
        data = artists
    }
    
    // MARK: - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a reusable cell (connects with the table view cell in our storyboard)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        
        // Grab an artist from the data source
        let artist = data[indexPath.row]
        
        // Assign the artist to textLabel property
        cell.textLabel?.text = artist.name
        
        return cell
    }
    
    // MARK: - Helper Methods
    
    func artist(at indexPath: IndexPath) -> Artist {
        return data[indexPath.row]
    }
}

















