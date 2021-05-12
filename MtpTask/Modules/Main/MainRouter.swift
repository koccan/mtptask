//
//  MainRouter.swift
//  MtpTask
//
//  Created by Can KOÇ on 11.05.2021.
//

import UIKit

class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> MainViewController {
        let view = MainViewController(nibName: "Main", bundle: nil)
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func showDetail(with contentItem: ContentModel) {
        viewController?.navigationController?.pushViewController(DetailRouter.createModule(with: contentItem), animated: true)
    }
    
    func showAlert(with text: String) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.viewController?.present(alert, animated: true, completion: nil)
    }
}
