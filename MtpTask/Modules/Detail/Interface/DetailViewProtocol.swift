//
//  DetailViewProtocol.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import Foundation

protocol DetailViewProtocol: class {
    
    var presenter: DetailPresenterToViewProtocol?  { get set }
    func setBlurUI()
    func showNavigationBar()
    func hideNavigationBar()
    func bindElements()
}
