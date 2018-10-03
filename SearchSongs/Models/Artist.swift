//
//  Artist.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/3/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//
//  Why classes?
//  We usually define our models using structs, but we need reference types this time around. We're going to be passing objects around from one VC to the next and mutating certaint properties based on user input. With the copy behavior of value types, ethis can get messy. We'Re also going to need to maintain states across our models, and value types aren't good at that.
//

import Foundation

class Artist {
    let id: Int
    let name: String
    let primaryGenre: Genre
    var albums: [Album]
    
    init(id: Int, name: String, primaryGenre: Genre, albums: [Album]) {
        self.id = id
        self.name = name
        self.primaryGenre = primaryGenre
        self.albums = albums
    }
}







