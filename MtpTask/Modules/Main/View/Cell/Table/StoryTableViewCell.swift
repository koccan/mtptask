//
//  StoryTableViewCell.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        collectionStory.backgroundColor = .clear
    }
    
    func setCellLayout(with cellPerRow: Int) {
        let columnLayout = ColumnFlowLayout(
            cellsPerRow: cellPerRow,
            extraItemHeight: 63, // labelsHeight
            minimumInteritemSpacing: 15,
            minimumLineSpacing: 30,
            sectionInset: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        )
        collectionStory.collectionViewLayout = columnLayout
        collectionStory.contentInsetAdjustmentBehavior = .always
        let cellId = StoryCollectionViewCell.nameOfClass
        collectionStory.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    // MARK: - Outlet
    
    @IBOutlet weak var collectionStory: UICollectionView!
}
