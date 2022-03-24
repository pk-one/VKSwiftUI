//
//  UserRowView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import SwiftUI

struct UserRowView: View {
    
    var user: User
    
    var body: some View {
        HStack {
            Image(user.avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            VStack(alignment: .leading){
                Text(user.fullName)
                Text(user.cityName ?? "")
                    .font(.caption2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User(avatar: "user-2-1", firstName: "Mark", secondName: "Wohlberg", cityName: "Canzas"))
    }
}
