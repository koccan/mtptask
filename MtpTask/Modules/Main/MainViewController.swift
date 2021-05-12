//
//  MainViewController.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenterToViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.presenter?.viewWillLayoutSubviews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Outlet
     
    @IBOutlet weak fileprivate var tableMain: UITableView!
    @IBOutlet weak fileprivate var loader: UIActivityIndicatorView!
    
}

// MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {
    
    func stopLoader() {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
        }
    }
    
    func setMainTableViewUI() {
        tableMain.tableFooterView = UIView()
        tableMain.backgroundColor = .clear
    }
    
    func setNavigationUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.barStyle = .blackTranslucent
        
        let backItem = UIBarButtonItem()
        backItem.title = String()
        backItem.tintColor = .white
        navigationItem.backBarButtonItem = backItem
    }
    
    func registerMainCells() {
        let titleCellId = TitleTableViewCell.nameOfClass
        tableMain.register(UINib(nibName: titleCellId, bundle: nil), forCellReuseIdentifier: titleCellId)
        
        let bannerCellId = BannerTableViewCell.nameOfClass
        tableMain.register(UINib(nibName: bannerCellId, bundle: nil), forCellReuseIdentifier: bannerCellId)
        
        
        let meditationCellId = MeditationTableViewCell.nameOfClass
        tableMain.register(UINib(nibName: meditationCellId, bundle: nil), forCellReuseIdentifier: meditationCellId)
        
        let storyCellId = StoryTableViewCell.nameOfClass
        tableMain.register(UINib(nibName: storyCellId, bundle: nil), forCellReuseIdentifier: storyCellId)
    }
    
    func setMainTableViewDelegate() {
        tableMain.delegate = self
        tableMain.dataSource = self
    }
    
    func reloadMainTableView() {
        DispatchQueue.main.async {
            self.tableMain.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.mainCellsCount ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter?.mainCell(at: indexPath.row) {
        case .title(let text):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.nameOfClass, for: indexPath) as? TitleTableViewCell else { return UITableViewCell() }
            cell.title = text
            return cell
        case .banner:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.nameOfClass, for: indexPath) as? BannerTableViewCell else { return UITableViewCell() }
            return cell
        case .meditations:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MeditationTableViewCell.nameOfClass, for: indexPath) as? MeditationTableViewCell else { return UITableViewCell() }
            cell.collectionMeditation.tag = MainCollectionViewEnum.metitation.rawValue
            cell.collectionMeditation.dataSource = self
            cell.collectionMeditation.delegate = self
            return cell
        case .stories:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.nameOfClass, for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }
            cell.collectionStory.tag = MainCollectionViewEnum.story.rawValue
            cell.setCellLayout(with: self.presenter?.storyCellCountPerRow ?? 0)
            cell.collectionStory.dataSource = self
            cell.collectionStory.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch presenter?.mainCell(at: indexPath.row) {
        case .stories:
            return presenter?.storyCollectionHeight ?? 0
        default:
            return UITableView.automaticDimension
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch MainCollectionViewEnum(rawValue: collectionView.tag) {
        case .metitation:
            return (presenter?.meditationsCount ?? 0)
        case .story:
            return (presenter?.storiesCount ?? 0)
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch MainCollectionViewEnum(rawValue: collectionView.tag) {
        case .metitation:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeditationCollectionViewCell.nameOfClass, for: indexPath) as? MeditationCollectionViewCell else { return UICollectionViewCell() }
            cell.cellItem = presenter?.meditation(at: indexPath.row)
            return cell
        case .story:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.nameOfClass, for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }
            cell.cellItem = presenter?.story(at: indexPath.row)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch MainCollectionViewEnum(rawValue: collectionView.tag) {
        case .metitation:
            self.presenter?.didMeditationTapped(at: indexPath.row)
        case .story:
            self.presenter?.didStoryTapped(at: indexPath.row)
        default: break
        }
    }
}
