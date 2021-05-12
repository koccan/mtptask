//
//  MainPresenterProtocol.swift
//  MtpTask
//
//  Created by Can KOÇ on 11.05.2021.
//

import UIKit

protocol MainPresenterToViewProtocol: class {
    
    func viewDidLoad()
    func viewWillLayoutSubviews()
    
    var mainCellsCount: Int { get }
    var meditationsCount: Int { get }
    var storiesCount: Int { get }
    var storyCollectionHeight: CGFloat { get }
    
    func mainCell(at index: Int) -> MainTableItemEnum?
    func meditation(at index: Int) -> ContentModel?
    func story(at index: Int) -> ContentModel?
    
    func didMeditationTapped(at index: Int)
    func didStoryTapped(at index: Int)
    var storyCellCountPerRow: Int { get }
}

protocol MainPresenterToInteractorProtocol: class {
    
    func created(mainItems: MainModel)
    func handleJsonDecodeError()
    func handleJsonNotFoundError()
    func handleDataNotFoundError()
    func handleGeneralError()
}
