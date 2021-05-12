//
//  StoryCollectionViewCell.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell, ImageShowable {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
    }
    
    var cellItem: ContentModel? {
        didSet {
            labelTitle.text = cellItem?.title
            labelDescription.text = cellItem?.subTitle
            
            showImageWithAnimation(from: cellItem?.image.small, on: imageView)
        }
    }
    
    // MARK: - Outlet
    
    @IBOutlet weak fileprivate var imageView: UIImageView!
    @IBOutlet weak fileprivate var labelTitle: UILabel!
    @IBOutlet weak fileprivate var labelDescription: UILabel!
}
