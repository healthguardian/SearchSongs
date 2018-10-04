//
//  SearchResultsController.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/3/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let dataSource = SearchResultsDataSource()
    let client = ItunesAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assigns the search bar to the header of table view
        tableView.tableHeaderView = searchController.searchBar
        
        // Assigns cancel button to the right bar button item of searchController
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissSearchResultsController))
        
        // Removes the dim background during presentation
        searchController.dimsBackgroundDuringPresentation = false
        
        // Assigns the SearchResultsController as the SearchResultsUpdater
        searchController.searchResultsUpdater = self
        
        // Assigns our SearchResultsDataSource to the table view
        tableView.dataSource = dataSource
        
        // Indicates wether this VC's view is covered when the VC or one its descendants presents another VC
        definesPresentationContext = true
    }
    
    @objc func dismissSearchResultsController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbums" {
            // Check for the indexPath of the selected row and assign it to indexPath
            if let indexPath = tableView.indexPathForSelectedRow {
                // Assign value of artist at the indexPath
                let artist = dataSource.artist(at: indexPath)
                let albumListController = segue.destination as! AlbumListController
                
                // This is where we set up our API call
                client.lookupArtist(withId: artist.id) { artist, error in
                    albumListController.artist = artist
                    albumListController.tableView.reloadData()
                }
            }
        }
    }
}

extension SearchResultsController: UISearchResultsUpdating {
    
    // Check for each new character change and update search results
    func updateSearchResults(for searchController: UISearchController) {
        
        // Print search queries in the console anytime it comes up
        // print(searchController.searchBar.text)
        
        // Update search results with on stub data
        // dataSource.update(with: [Stub.artist])
        
        // Reload our search results into the view
        // tableView.reloadData()
        
        client.searchForArtists(withTerm: searchController.searchBar.text!) { [weak self] artists, error in
            self?.dataSource.update(with: artists)
            self?.tableView.reloadData()
        }
        
    }
}











