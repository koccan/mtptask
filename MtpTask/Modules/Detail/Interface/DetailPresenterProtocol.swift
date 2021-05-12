//
//  DetailPresenterProtocol.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import Foundation

protocol DetailPresenterToViewProtocol: class {
    func viewDidLoad()
    func viewWillDisappear()
    
    var title: String? { get }
    var description: String? { get }
    var date: String? { get }
    var image: String? { get }
}

protocol DetailPresenterToInteractorProtocol: class {
    
}
