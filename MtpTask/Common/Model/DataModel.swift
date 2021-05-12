//
//  DataModel.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import Foundation

struct DataModel: Codable {
    var isBannerEnabled: Bool
    var meditations: [MeditationModel]
    var stories: [StoryModel]
}
