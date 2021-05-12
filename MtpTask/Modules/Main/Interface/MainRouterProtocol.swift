//
//  MainRouterProtocol.swift
//  MtpTask
//
//  Created by Can KOÇ on 11.05.2021.
//

import UIKit

protocol MainRouterProtocol: class {
    
    func showDetail(with contentItem: ContentModel)
    func showAlert(with text: String)
}
