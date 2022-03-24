//
//  GroupListView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import SwiftUI

struct GroupListView: View {
    
    let viewModel: GroupsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.getGroups(), id: \.id) { group in
                GroupRowView(group: group)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Groups")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView(viewModel: GroupsViewModel())
    }
}
