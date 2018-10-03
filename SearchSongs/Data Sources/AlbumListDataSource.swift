//
//  AlbumListDataSource.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/3/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {
    
    private let albums: [Album]
    
    init(albums: [Album]) {
        self.albums = albums
        super.init()
    }

    // MARK: - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as! AlbumCell
        
        // Get an instance out of the data source
        let album = albums[indexPath.row]
        
        // Create a view model using this album instance
        let viewModel = AlbumCellViewModel(album: album)
        
        // Use this view model to configure the cell
        albumCell.configure(with: viewModel)
        
        // Add a disclosure indicator to the cell
        albumCell.accessoryType = .disclosureIndicator
        
        return albumCell
    }
    
    // MARK: - Helper Methods
    
    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }
}














