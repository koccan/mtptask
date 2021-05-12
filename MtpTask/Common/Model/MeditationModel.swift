//
//  MeditationModel.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import Foundation

struct MeditationModel: Codable {
    var title: String
    var subtitle: String
    var image: ImageModel
    var releaseDate: String
    var content: String
}
