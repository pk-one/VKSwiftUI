//
//  GroupRowView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import SwiftUI
import Kingfisher

struct GroupRowView: View {
    
    var group: GroupItems
    
    var body: some View {
        HStack {
            let url = URL(string: group.photo)
            KFImage(url)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            VStack(alignment: .leading){
                Text(group.name)
                    .lineLimit(1)
                
                if let activity = group.activity {
                    Text(activity)
                        .font(.caption2)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupRowView(group: GroupItems(id: 1, name: "Test", photo: "https://sun9-81.userapi.com/s/v1/ig2/JJIuitvT3Zrn-WLNPDeI8FmMUDBZZsuLYciXW8S7S6sAZTw54UlsrcCzap5mjRdL3igDHZdjx5xRCNCn1sLW0EsB.jpg?size=50x50&quality=96&crop=2,23,1202,1202&ava=1", activity: "Рыбалка"))
    }
}
