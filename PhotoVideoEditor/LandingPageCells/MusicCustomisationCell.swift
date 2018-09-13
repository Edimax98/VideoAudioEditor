//
//  MusicCustomisationCell.swift
//  PhotoVideoEditor
//
//  Created by Даниил on 13.09.2018.
//  Copyright © 2018 Даниил. All rights reserved.
//

import UIKit

class MusicCustomisationCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static var identifier = "MusicCustomisationCell"
    fileprivate var images = ["ecvalizer", "sound_editor", "track_editor"]
    fileprivate let defaultBackgroundColor = UIColor(red: 60 / 255, green: 61 / 255, blue: 98 / 255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.backgroundColor = defaultBackgroundColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MusicCell", bundle: nil), forCellWithReuseIdentifier: MusicCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource
extension MusicCustomisationCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCell.identifier, for: indexPath) as? MusicCell else {
            return UICollectionViewCell()
        }
        cell.image.image = UIImage(named: images[indexPath.row])
        return cell
    }
}

extension MusicCustomisationCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 500)
    }
}









