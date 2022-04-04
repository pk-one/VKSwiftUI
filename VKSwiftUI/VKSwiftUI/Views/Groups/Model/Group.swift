//
//  Group.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import Foundation

struct Group: Codable {
    let response: GroupResponse
}

struct GroupResponse: Codable {
    let items: [GroupItems]
}

struct GroupItems: Codable, Identifiable {
    let id: Int
    let name: String
    let photo: String
    let activity: String?
    
    enum CodingKeys: String, CodingKey {
        case photo = "photo_50"
        case id, name, activity
    }
}
