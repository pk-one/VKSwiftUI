//
//  Photos.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation

struct Photos: Codable {
    let response: PhotosResponse
}

struct PhotosResponse: Codable {
    let items: [PhotosItems]
}

struct PhotosItems: Codable, Identifiable {
    let id: Int
    let ownerId: Int
    let image: [Sizes]
//    let likes:
    
    struct Sizes: Codable {
        let url: String?
        let width: Int
        let height: Int
    }
    
    enum CodingKeys: String, CodingKey {
        case ownerId = "owner_id"
        case image = "sizes"
        case id
    }
}

