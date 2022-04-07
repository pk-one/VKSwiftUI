//
//  Post.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 04.04.2022.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let photoOwnerPost: URL
    let nameOwnerPost: String
    let bodyPost: NewsItems
}
