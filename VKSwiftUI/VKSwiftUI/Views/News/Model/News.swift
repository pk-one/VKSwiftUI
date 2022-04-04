//
//  News.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 29.03.2022.
//

import Foundation

struct News: Codable {
    let response: NewsResponse
}

struct NewsResponse: Codable {
    let items: [NewsItems]
}

struct NewsItems: Codable, Identifiable {
    let id: Int
    let sourceId: Int
    let date: Date
    let text: String?
    let attachments: [Attachments]?
//
    let comments: Comments?
    let likes: Likes?
    let reposts: Reposts?
    let views: Views?
    
    struct Attachments: Codable {
        let photo: Size?
    }
    
    struct Size: Codable {
        let sizes: [Sizes]
    }
    
    struct Sizes: Codable {
        let height: Int
        let url: String
        let width: Int
    }

    struct Comments: Codable {
        let count: Int
    }

    struct Likes: Codable {
        let count: Int
    }

    struct Reposts: Codable {
        let count: Int
    }

    struct Views: Codable {
        let count: Int
    }

    enum CodingKeys: String, CodingKey {
        case id = "post_id"
        case sourceId = "source_id"

        case date, text, attachments, comments, likes, reposts, views
//
//
//
//
    }
}
