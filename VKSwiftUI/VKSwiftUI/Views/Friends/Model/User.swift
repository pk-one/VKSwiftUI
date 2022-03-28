//
//  User.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import Foundation

struct User: Codable {
    let response: UserResponse
}

struct UserResponse: Codable {
    let items: [UserItems]
}

struct UserItems: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let online: Int
    let photo: String
    let city: City?
    
    struct City: Codable {
        let title: String
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case id, online, city
    }
}
