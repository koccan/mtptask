//
//  DetailPresenter.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import Foundation

class DetailPresenter {
    
    weak private var view: DetailViewProtocol?
    private let interactor: DetailInteractorProtocol
    private let router: DetailRouterProtocol
    
    init(interface: DetailViewProtocol, interactor: DetailInteractorProtocol, router: DetailRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    var contentItem: ContentModel?
}


// MARK: - DetailPresenterToViewProtocol

extension DetailPresenter: DetailPresenterToViewProtocol, DatePrintable {
    
    func viewDidLoad() {
        self.view?.showNavigationBar()
        self.view?.setBlurUI()
        self.view?.bindElements()
    }
    
    func viewWillDisappear() {
        self.view?.hideNavigationBar()
    }
    
    var title: String? {
        return contentItem?.title
    }
    
    var description: String? {
        return contentItem?.subTitle
    }
    
    var date: String? {
        return getDate(from: contentItem?.date)
    }
    
    var image: String? {
        return contentItem?.image.large
    }
}

// MARK: - DetailPresenterToInteractorProtocol

extension DetailPresenter: DetailPresenterToInteractorProtocol {
}
