//
//  DjangoApiModel.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/09.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import Foundation
import UIKit

struct ArticleList: Codable {
    let count: Int
    let next: String? = nil
    let previous: String? = nil
    let results: [NewsObjects]
}

//Newsの構造
struct NewsObjects: Codable {
    let title: String
    let genre: String
    let body: String
    let siteUrl: String
    let imageUrl: String
    let createdAt: String
//    let updatedAt: String
    let status: String
    let author: Author
    
    enum CodingKeys: String, CodingKey {
        case title
        case genre
        case body
        case siteUrl = "site_Url"
        case imageUrl = "image_url"
        case createdAt = "created_at"
//        case updatedAt = "updated_at"
        case status
        case author
    }
}

struct Author: Codable {
    let name: String
    let mail: String
}

struct Recommend: Codable {
    let count: Int
    let next: String? = nil
    let previous: String? = nil
    let results: [RecommendList]
}

struct RecommendList: Codable {
    let title: String
    let siteUrl: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case siteUrl = "site_url"
        case imageUrl = "image_url"
    }
}

struct VoteList: Codable {
    let count: Int
    let next: String? = nil
    let previous: String? = nil
    let results: [VoteObjects]
}

struct VoteObjects: Codable {
    let vacantValue: String
    let subtleValue: String
    let noVacantValue: String
    
    enum CodingKeys: String, CodingKey {
        case vacantValue = "vacant_value"
        case subtleValue = "subtle_value"
        case noVacantValue = "no_vacant_value"
    }
}

