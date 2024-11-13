//
//  NewsModel.swift
//  JustLoginCodingTest
//
//  Created by Christopher Sonny on 13/11/24.
//

import Foundation

struct News: Codable, Equatable {
    var id: Int?
    var title: String?
    var content: String?
    var image: String?
    var thumbnail: String?
    var status: String?
    var publishedAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case thumbnail
        case image
        case status
        case publishedAt
        case updatedAt
    }
}
