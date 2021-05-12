//
//  RadiusView.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import UIKit

@IBDesignable
public class RadiusView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 { didSet { updateCorners() }}

    private func updateCorners() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateCorners()
    }
}
