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
    
    var fullName: String {
        return firstName + " " + secondName
    }
}

struct UsersList {
    
    static let myFriends = [User(avatar: "user-1-1", firstName: "Vladimir", secondName: "Ivanov", cityName: "Moskow"),
                            User(avatar: "user-2-1", firstName: "Andrey", secondName: "Martynov", cityName: "Saint-Peterburg"),
                            User(avatar: "user-3-1", firstName: "Igor", secondName: "Kovalyov", cityName: "Kaliningrad"),
                            User(avatar: "user-4-1", firstName: "Ilon", secondName: "Mask", cityName: "California"),
                            User(avatar: "user-1-1", firstName: "Vladimir", secondName: "Ivanov", cityName: "Moskow"),
                            User(avatar: "user-2-1", firstName: "Andrey", secondName: "Martynov", cityName: "Saint-Peterburg"),
                            User(avatar: "user-3-1", firstName: "Igor", secondName: "Kovalyov", cityName: "Kaliningrad"),
                            User(avatar: "user-4-1", firstName: "Ilon", secondName: "Mask", cityName: "California"),User(avatar: "user-1-1", firstName: "Vladimir", secondName: "Ivanov", cityName: "Moskow"),
                            User(avatar: "user-2-1", firstName: "Andrey", secondName: "Martynov", cityName: "Saint-Peterburg"),
                            User(avatar: "user-3-1", firstName: "Igor", secondName: "Kovalyov", cityName: "Kaliningrad"),
                            User(avatar: "user-4-1", firstName: "Ilon", secondName: "Mask", cityName: "California")]
}
