//
//  GroupRowView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import SwiftUI

struct GroupRowView: View {
    var group: Group
    
    var body: some View {
        HStack {
            Image(group.avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            VStack(alignment: .leading){
                Text(group.name)
                    .lineLimit(1)
                Text(group.description)
                    .font(.caption2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupRowView(group: Group(avatar: "group-1", name: "Рыбалка в Калининграде - Калининградский рыболов", description: "Рыбалка"))
    }
}
