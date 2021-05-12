//
//  MainInteractorProtocol.swift
//  MtpTask
//
//  Created by Can KOÇ on 11.05.2021.
//

import UIKit

protocol MainInteractorProtocol: class {
    
    var presenter: MainPresenterToInteractorProtocol?  { get set }
    func getMainTableItems()
    func calculateStoryCellHeight(for count: Int) -> CGFloat
    func getStoryCellPerRow() -> Int
}
