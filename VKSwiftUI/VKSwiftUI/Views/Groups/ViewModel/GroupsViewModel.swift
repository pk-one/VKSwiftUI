//
//  GroupsViewModel.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 15.03.2022.
//

import Foundation
import RealmSwift

final class GroupsViewModel: ObservableObject {
    
    private let networkService = DataOperation()
    
    @Published private(set) var groups = [GroupItems]()
    @Published var isErrorShow: Bool = false
    
    private(set) var errorMessage: String?
    
    //MARK: - Methods
    func getGroups() {
        networkService.getGroupsData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(groups):
                self.groups = self.createGroupModel(groupResults: groups)
            case let .failure(error):
                self.showError(error: error)
            }
        }
    }
    
    private func createGroupModel(groupResults: Results<GroupRealm>) -> [GroupItems] {
        groupResults.map { item in
            GroupItems(id: item.id, name: item.name, photo: item.photo, activity: item.activity)
        }
    }
    
    private func showError(error: Error) {
        errorMessage = error.localizedDescription
        isErrorShow = true
    }
}
