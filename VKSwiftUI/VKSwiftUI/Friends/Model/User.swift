//
//  User.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let avatar: String
    let firstName: String
    let secondName: String
    let cityName: String?
    let photos: [String]
    
    var fullName: String {
        return firstName + " " + secondName
    }
}

struct UsersList {
    
    static let myFriends = [User(avatar: "user-1-1", firstName: "Vladimir", secondName: "Ivanov", cityName: "Moskow", photos: ["user-2-1", "user-2-2", "user-2-3", "user-2-4"]),
                            User(avatar: "user-2-1", firstName: "Andrey", secondName: "Martynov", cityName: "Saint-Peterburg",  photos: []),
                            User(avatar: "user-3-1", firstName: "Igor", secondName: "Kovalyov", cityName: "Kaliningrad", photos: []),
                            User(avatar: "user-4-1", firstName: "Ilon", secondName: "Mask", cityName: "California", photos: []),
                            User(avatar: "user-1-1", firstName: "Vladimir", secondName: "Ivanov", cityName: "Moskow", photos: []),
                            User(avatar: "user-2-1", firstName: "Andrey", secondName: "Martynov", cityName: "Saint-Peterburg", photos: []),
                            User(avatar: "user-3-1", firstName: "Igor", secondName: "Kovalyov", cityName: "Kaliningrad", photos: []),
                            User(avatar: "user-4-1", firstName: "Ilon", secondName: "Mask", cityName: "California", photos: []),
                            User(avatar: "user-1-1", firstName: "Vladimir", secondName: "Ivanov", cityName: "Moskow", photos: []),
                            User(avatar: "user-2-1", firstName: "Andrey", secondName: "Martynov", cityName: "Saint-Peterburg", photos: []),
                            User(avatar: "user-3-1", firstName: "Igor", secondName: "Kovalyov", cityName: "Kaliningrad", photos: []),
                            User(avatar: "user-4-1", firstName: "Ilon", secondName: "Mask", cityName: "California", photos: [])]
}
