//
//  AppView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 28.03.2022.
//

import SwiftUI

struct AppView: View {
    
    @AppStorage("userToken") var token: String?
    
    var body: some View {
        HStack {
            if token == nil {
                LoginView()
            } else {
                NewsListView()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
