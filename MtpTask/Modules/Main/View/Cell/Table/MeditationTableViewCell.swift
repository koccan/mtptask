//
//  MeditationTableViewCell.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import UIKit

class MeditationTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        collectionMeditation.backgroundColor = .clear
        
        let cellId = MeditationCollectionViewCell.nameOfClass
        collectionMeditation.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    // MARK: - Outlet
    
    @IBOutlet weak var collectionMeditation: UICollectionView!
}
