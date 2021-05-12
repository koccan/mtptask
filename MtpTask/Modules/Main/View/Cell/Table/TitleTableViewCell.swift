//
//  TitleTableViewCell.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }

    var title: String? {
        didSet {
            lblTitle.text = title
        }
    }
    
    // MARK: - Outlet
    
    @IBOutlet fileprivate weak var lblTitle: UILabel!
}
