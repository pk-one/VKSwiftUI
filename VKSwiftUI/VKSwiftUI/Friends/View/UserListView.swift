//
//  UserListView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import SwiftUI

struct UserListView: View {
   
    let viewModel: UsersViewModel
    
    var body: some View {
        NavigationView {
            List(self.viewModel.getFriends(), id: \.id) { user in
                NavigationLink {
                    LazyView(UserPhotoAlbumView(user: user)) 
                } label: {
                    UserRowView(user: user)
                        .listRowSeparator(.hidden)
                }

               
            }
            .listStyle(.plain)
            .navigationTitle("Friends")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: UsersViewModel())
    }
}
