//
//  FriendPhotoAlbumViewModel.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation
import SwiftUI

final class FriendPhotoAlbumViewModel: ObservableObject {
    
    let networkService = DataOperation()
    
    @Published private(set) var photos = [PhotosItems]()
    
    private let user: UserItems
    
    init(user: UserItems) {
        self.user = user
    }
    
    var fullName: String {
        return user.firstName + " " + user.lastName
    }
    
    func getUserPhotos() {
        networkService.getPhotosUser(ownerId: user.id) { photos in
            self.photos = photos
        }
    }
}
