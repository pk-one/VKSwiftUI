//
//  UserRowView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    
    var user: UserItems
    
    var body: some View {
        HStack {
            let url = URL(string: user.photo)
            ZStack {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)

                if user.online == 1 {
                    Circle()
                        .frame(width: 13, height: 13)
                        .foregroundColor(.white)
                        .padding(.leading, 39)
                        .padding(.top, 29)
                    
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.green)
                        .padding(.leading, 39)
                        .padding(.top, 29)
                    }
                }
            
            VStack(alignment: .leading){
                Text(user.firstName + " " + user.lastName)
                if user.city != nil {
                    Text(user.city?.title ?? "")
                        .font(.caption2)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: UserItems(id: 1, firstName: "Fufel", lastName: "Shmerch", online: 0, photo: "https://sun9-81.userapi.com/s/v1/ig2/JJIuitvT3Zrn-WLNPDeI8FmMUDBZZsuLYciXW8S7S6sAZTw54UlsrcCzap5mjRdL3igDHZdjx5xRCNCn1sLW0EsB.jpg?size=50x50&quality=96&crop=2,23,1202,1202&ava=1", city: nil))
    }
}
