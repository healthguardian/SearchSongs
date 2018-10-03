//
//  SearchResultsController.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/3/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissSearchResultsController))
    }
    
    @objc func dismissSearchResultsController() {
        self.dismiss(animated: true, completion: nil)
    }
}
