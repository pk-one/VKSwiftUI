//
//  Group.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import Foundation

struct Group: Identifiable {
    let id = UUID()
    let avatar: String
    let name: String
    let description: String
}

struct GroupsList {
    static let myGroups = [Group(avatar: "group-1", name: "Рыбалка в Калининграде - Калининградский рыболов", description: "Рыбалка"),
                           Group(avatar: "group-2", name: "Рыбалка в Калининграде - KONIGFISHING", description: "Рыбалка"),
                           Group(avatar: "group-3", name: "Калининградский Рыболовный Форум", description: "Рыбалка"),
                           Group(avatar: "group-4", name: "Темная сторона", description: "Юмор")]
}
