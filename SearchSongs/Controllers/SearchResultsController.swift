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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissSearchResultsController))
        
        // Assign the search bar to the header of table view
        tableView.tableHeaderView = searchController.searchBar
        
        // Remove the dim background during presentation
        searchController.dimsBackgroundDuringPresentation = false
        
        // Assign the SearchResultsController as the SearchResultsUpdater
        searchController.searchResultsUpdater = self
    }
    
    @objc func dismissSearchResultsController() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SearchResultsController: UISearchResultsUpdating {
    
    // Check for each new character change and update search results
    func updateSearchResults(for searchController: UISearchController) {
        
        // Print search queries in the console anytime it comes up
        print(searchController.searchBar.text)
    }
}











