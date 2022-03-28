//
//  UsersViewModel.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 15.03.2022.
//

import Combine
import RealmSwift

final class UsersViewModel: ObservableObject {
    
    private let networkService = DataOperation()
    
    @Published private(set) var users = [UserItems]()
    @Published var isErrorShow: Bool = false
    
    private(set) var errorMessage: String?
    
    //MARK: - Methods
    func getFriendsData() {
        networkService.getFriendsData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(users):
                self.users = self.createUserModel(userResults: users)
            case let .failure(error):
                self.showError(error: error)
            }
        }
    }
    
    private func createUserModel(userResults: Results<UserRealm>) -> [UserItems] {
        userResults.map { item in
            UserItems(id: item.id, firstName: item.firstName, lastName: item.lastName, online: item.online, photo: item.photo, city: UserItems.City(title: item.city ?? ""))
        }
    }
    
    private func showError(error: Error) {
        errorMessage = error.localizedDescription
        isErrorShow = true
    }
}
