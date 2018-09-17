//
//  VideoCustomisationCellTableViewCell.swift
//  PhotoVideoEditor
//
//  Created by Даниил on 17.09.2018.
//  Copyright © 2018 Даниил. All rights reserved.
//

import UIKit

class VideoCustomisationCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    static var identifier = "VideoCustomisationCell"
    fileprivate var images = ["effects","montage","settings"]
    fileprivate var cellWidthOffset: CGFloat = 20
    fileprivate var cellHeight: CGFloat = 376
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "VideoCell", bundle: nil), forCellWithReuseIdentifier: VideoCell.identifier)
    }
}

// MARK: - UITableViewDataSource
extension VideoCustomisationCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCell.identifier, for: indexPath) as? VideoCell else {
            return UICollectionViewCell()
        }
        
        if let image = UIImage(named: images[indexPath.row]) {
            cell.imageView.image = image
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension VideoCustomisationCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 20 * 2, height: cellHeight)
    }
}


