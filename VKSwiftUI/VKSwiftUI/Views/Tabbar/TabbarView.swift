//
//  TabbarView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 29.03.2022.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "house.fill"
    case friends = "person.2.fill"
    case groups = "person.3.fill"
}

struct TabbarView: View {
    var body: some View {
        TabView {
            NewsListView(viewModel: NewsViewModel())
                .tabItem {
                    Image(systemName: Tab.home.rawValue)
                    Text("Home")
                }
            
            UserListView(viewModel: UsersViewModel())
                .tabItem {
                    Image(systemName: Tab.friends.rawValue)
                    Text("Friends")
                }
            GroupListView(viewModel: GroupsViewModel())
                .tabItem {
                    Image(systemName: Tab.groups.rawValue)
                    Text("Groups")
                }
        }
        .onAppear {
            if #available(iOS 15.0, *) {
                let appearanceTabBar = UITabBarAppearance()
                UITabBar.appearance().scrollEdgeAppearance = appearanceTabBar
                UITabBar.appearance().backgroundColor = .systemBackground
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
