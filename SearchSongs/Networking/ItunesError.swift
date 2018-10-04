//
//  ItunesError.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/4/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
