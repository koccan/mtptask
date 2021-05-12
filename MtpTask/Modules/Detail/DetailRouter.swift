//
//  DetailRouter.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(with contentItem: ContentModel) -> DetailViewController {
        let view = DetailViewController(nibName: "Detail", bundle: nil)
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interface: view, interactor: interactor, router: router)
        
        presenter.contentItem = contentItem
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
