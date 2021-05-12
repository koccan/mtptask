//
//  MainViewProtocol.swift
//  MtpTask
//
//  Created by Can KOÇ on 11.05.2021.
//

import Foundation

protocol MainViewProtocol: class {
    
    var presenter: MainPresenterToViewProtocol?  { get set }
    func stopLoader()
    func setMainTableViewUI()
    func setNavigationUI()
    func registerMainCells()
    func setMainTableViewDelegate()
    func reloadMainTableView()
}
