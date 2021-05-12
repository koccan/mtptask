//
//  StoryModel.swift
//  MtpTask
//
//  Created by Can KOÇ on 12.05.2021.
//

import Foundation

struct StoryModel: Codable {
    var name: String
    var category: String
    var image: ImageModel
    var date: String
    var text: String
}
