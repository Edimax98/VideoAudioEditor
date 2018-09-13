//
//  MusicCell.swift
//  PhotoVideoEditor
//
//  Created by Даниил on 13.09.2018.
//  Copyright © 2018 Даниил. All rights reserved.
//

import UIKit

class MusicCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    fileprivate let cornerRadius: CGFloat = 10
    static var identifier = "MusicCell"
    override func awakeFromNib() {
        super.awakeFromNib()
       image.layer.cornerRadius = cornerRadius
        image.layer.masksToBounds = true
    }
}
