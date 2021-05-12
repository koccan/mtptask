//
//  MainPresenter.swift
//  MtpTask
//
//  Created by Can KOÇ on 11.05.2021.
//

import UIKit

class MainPresenter {
    
    weak private var view: MainViewProtocol?
    private let interactor: MainInteractorProtocol
    private let router: MainRouterProtocol
    
    init(interface: MainViewProtocol, interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    private var mainItem: MainModel?
}

// MARK: - MainPresenterToViewProtocol

extension MainPresenter: MainPresenterToViewProtocol {
    
    func viewDidLoad() {
        view?.setMainTableViewUI()
        view?.setNavigationUI()
        view?.registerMainCells()
        view?.setMainTableViewDelegate()
        interactor.getMainTableItems()
    }
    
    func viewWillLayoutSubviews() {
        // reload for layout updating when screen size changed
        view?.reloadMainTableView()
    }
    
    var mainCellsCount: Int {
        return mainItem?.tableViewItems.count ?? 0
    }
    
    var meditationsCount: Int {
        return mainItem?.meditations.count ?? 0
    }
    
    var storiesCount: Int {
        return mainItem?.stories.count ?? 0
    }
    
    var storyCollectionHeight: CGFloat {
        return interactor.calculateStoryCellHeight(for: storiesCount)
    }
    
    func mainCell(at index: Int) -> MainTableItemEnum? {
        return mainItem?.tableViewItems[index]
    }
    
    func meditation(at index: Int) -> ContentModel? {
        return mainItem?.meditations[index]
    }
    
    func story(at index: Int) -> ContentModel? {
        return mainItem?.stories[index]
    }
    
    func didMeditationTapped(at index: Int) {
        guard let contentItem = mainItem?.meditations[index] else {
            router.showAlert(with: "Meditation Not Found")
            return
        }
        router.showDetail(with: contentItem)
    }
    
    func didStoryTapped(at index: Int) {
        guard let contentItem = mainItem?.stories[index] else {
            router.showAlert(with: "Story Not Found")
            return
        }
        router.showDetail(with: contentItem)
    }
    
    var storyCellCountPerRow: Int {
        interactor.getStoryCellCountPerRow()
    }
}

// MARK: - MainPresenterToInteractorProtocol

extension MainPresenter: MainPresenterToInteractorProtocol {
    
    func created(mainItems: MainModel) {
        mainItem = mainItems
        view?.stopLoader()
        view?.reloadMainTableView()
    }
    
    func handleJsonDecodeError() {
        router.showAlert(with: "Json Decode Error!")
    }
    
    func handleJsonNotFoundError() {
        router.showAlert(with: "Json Not Found Error!")
    }
    
    func handleDataNotFoundError() {
        router.showAlert(with: "Data Not Error!")
    }
    
    func handleGeneralError() {
        router.showAlert(with: "General Error!")
    }
}
