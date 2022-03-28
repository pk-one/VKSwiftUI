//
//  UserListView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import SwiftUI

struct UserListView: View {
   
    @ObservedObject var viewModel: UsersViewModel
    
    var body: some View {
        NavigationView {
            List(self.viewModel.users, id: \.id) { user in
                NavigationLink {
                    LazyView(FriendPhotoAlbumView(viewModel: FriendPhotoAlbumViewModel(user: user)))
                } label: {
                    UserRowView(user: user)
                       
                }
                .listRowSeparator(.hidden)
            }
            
            .listStyle(.plain)
            .navigationTitle("Friends")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.viewModel.getFriendsData()
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: UsersViewModel())
    }
}
