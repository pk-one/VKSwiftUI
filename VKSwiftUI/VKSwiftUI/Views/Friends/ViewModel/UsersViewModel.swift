//
//  UsersViewModel.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 15.03.2022.
//

import Combine

final class UsersViewModel: ObservableObject {
    
    private let networkService = DataOperation()
    
    @Published private(set) var users = [UserItems]()

    //MARK: - Methods
    func getFriendsData() {
        networkService.getFriendsData { [weak self] users in
            self?.users = users
        }
    }
}
