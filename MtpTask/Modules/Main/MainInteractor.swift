//
//  MainInteractor.swift
//  MtpTask
//
//  Created by Can KOÇ on 11.05.2021.
//

import UIKit

class MainInteractor {
    
    weak var presenter: MainPresenterToInteractorProtocol?
    
}

// MARK: - MainInteractorProtocol

extension MainInteractor: MainInteractorProtocol {
    
    func getMainTableItems() {
        self.loadJson { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                switch error as? MainError {
                case .dataNotFound:
                    self.presenter?.handleDataNotFoundError()
                default:
                    self.presenter?.handleJsonNotFoundError()
                }
                #if DEBUG
                print("Data Load Error: \(error)")
                #endif
            }
        }
    }
    
    func calculateStoryCellHeight(for itemCount: Int) -> CGFloat {
        let screenWitdh = (UIApplication.shared.keyWindow?.bounds.width ?? 0)
        let cellPerRow = getStoryCellPerRow()
        let extraItemHeight = cellPerRow == 2 ? 70 : 93 // minimumLineSpacing + labelsHeight
        let marginsAndInsets = 20 * (cellPerRow - 1)
        let height = ((screenWitdh - CGFloat(marginsAndInsets)) / CGFloat(cellPerRow).rounded(.down))
        return ((height + CGFloat(extraItemHeight)) * CGFloat(itemCount / cellPerRow))
    }
    
    func getStoryCellPerRow() -> Int {
        let screenWitdh = (UIApplication.shared.keyWindow?.bounds.width ?? 0)
        let cellPerRow = UIScreen.main.traitCollection.userInterfaceIdiom == .pad ? (screenWitdh > 375 ? 4 : 2) : 2
        return cellPerRow
    }
}

// MARK: - Private

extension MainInteractor {
    
    private func createMainTableItems(from data: DataModel) {
        var result: [MainTableItemEnum] = []
        result.append(.title(text: "Meditations"))
        result.append(.meditations)
        if data.isBannerEnabled {
            result.append(.banner)
        }
        result.append(.title(text: "Stories"))
        result.append(.stories)
        presenter?.created(mainItems: MainModel(tableViewItems: result, meditations: mapped(meditations: data.meditations), stories: mapped(stories: data.stories)))
    }
    
    private func mapped(stories: [StoryModel]) -> [ContentModel] {
        return stories.map({ ContentModel(title: $0.name, subTitle: $0.category, image: $0.image, date: $0.date, content: $0.text) })
    }
    
    private func mapped(meditations: [MeditationModel]) -> [ContentModel] {
        return meditations.map({ ContentModel(title: $0.title, subTitle: $0.subtitle, image: $0.image, date: $0.releaseDate, content: $0.content) })
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(DataModel.self, from: jsonData)
            createMainTableItems(from: decodedData)
        } catch {
            presenter?.handleJsonDecodeError()
            #if DEBUG
            print("Json Decode Error: \(error)")
            #endif
        }
    }
    
    private func loadJson(completion: @escaping (Result<Data, Error>) -> Void) {
        let url = URL(string: "https://jsonblob.com/api/jsonBlob/a07152f5-775c-11eb-a533-c90b9d55001f")!
        let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                if let data = data {
                    completion(.success(data))
                } else {
                    completion(.failure(MainError.dataNotFound))
                }
            }
        }
        urlSession.resume()
    }
}
