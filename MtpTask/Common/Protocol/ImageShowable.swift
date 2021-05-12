//
//  ImageShowable.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import UIKit

protocol ImageShowable {
    func showImageWithAnimation(from urlString: String?, on imageView: UIImageView)
}

extension ImageShowable {
    
    func showImageWithAnimation(from urlString: String?, on imageView: UIImageView) {
        guard let imageString = urlString, let imageURL = URL(string: imageString) else { return }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                UIView.transition(with: imageView, duration: 0.3, options: .transitionCrossDissolve, animations: { imageView.image = image }, completion: nil)
            }
        }
    }
}
