//
//  DetailViewController.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import UIKit

class DetailViewController: UIViewController {

    var presenter: DetailPresenterToViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }
    
    // MARK: - Outlet
    
    @IBOutlet weak fileprivate var labelTitle: UILabel!
    @IBOutlet weak fileprivate var labelDescription: UILabel!
    @IBOutlet weak fileprivate var labelDate: UILabel!
    @IBOutlet weak fileprivate var imageBackground: UIImageView!
    @IBOutlet weak fileprivate var viewBlur: UIVisualEffectView!
}

// MARK: - DetailViewProtocol

extension DetailViewController: DetailViewProtocol, ImageShowable {
    
    func bindElements() {
        labelTitle.text = presenter?.title
        labelDescription.text = presenter?.description
        labelDate.text = presenter?.date
        
        showImageWithAnimation(from: presenter?.image, on: imageBackground)
    }
    
    func setBlurUI() {
        viewBlur.layer.cornerRadius = 45
        viewBlur.layer.masksToBounds = true
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
