//
//  AlbumCell.swift
//  SearchSongs
//
//  Created by Maxence Roy on 10/3/18.
//  Copyright © 2018 Maxence Roy. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    static let reuseIdentifier = "AlbumCell"
    
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Takes values from AlbumCellViewModel.swift and assigns to Outlets
    func configure(with viewModel: AlbumCellViewModel) {
        albumTitleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
    }

}
