//
//  QueryItemProvider.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/4/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
