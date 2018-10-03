//
//  SongViewModel.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/3/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let duration: String
}

// We'll do it in an extension so we don't mess with the default memberwise initializer

extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName
        
        // Track time in milliseconds
        let timeInSeconds = song.trackTime/1000
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        
        self.duration = "\(minutes): \(seconds)"
    }
}







