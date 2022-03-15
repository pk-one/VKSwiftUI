//
//  UsersViewModel.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 15.03.2022.
//

import Foundation

final class UsersViewModel {
    private var friends = [User]()
    
    init() {
        friends = UsersList.myFriends
    }
    
    
    //MARK: - Methods
    func getFriends() -> [User] {
        return friends
    }
}
