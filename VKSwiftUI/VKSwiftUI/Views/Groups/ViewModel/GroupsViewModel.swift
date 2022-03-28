//
//  GroupsViewModel.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 15.03.2022.
//

import Foundation

final class GroupsViewModel: ObservableObject {
    
    private let networkService = DataOperation()
    
    @Published private(set) var groups = [GroupItems]()
    
    
    //MARK: - Methods
    func getGroups() {
        networkService.getGroupsData { [weak self] groups in
            self?.groups = groups
        }
    }
}
