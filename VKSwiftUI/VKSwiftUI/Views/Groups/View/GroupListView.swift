//
//  GroupListView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import SwiftUI

struct GroupListView: View {
    
    @ObservedObject var viewModel: GroupsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.groups, id: \.id) { group in
                GroupRowView(group: group)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Groups")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.getGroups()
            }
            .alert("Error", isPresented: $viewModel.isErrorShow) {
                     EmptyView()
                 } message: {
                     Text(viewModel.errorMessage ?? "")
                 }
        }
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView(viewModel: GroupsViewModel())
    }
}
