//
//  GroupsViewModel.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 15.03.2022.
//

import Foundation

final class GroupsViewModel {
    private var groups = [Group]()
    
    init() {
        groups = GroupsList.myGroups
    }
    
    //MARK: - Methods
    func getGroups() -> [Group] {
        return groups
    }
}
