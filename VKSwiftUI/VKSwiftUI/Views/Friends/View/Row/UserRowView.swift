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
    
    @State private var isTappedImage: Bool = false
    
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
            .scaleEffect(isTappedImage ? 1.3 : 0.8)
            .scaleEffect(isTappedImage ? 0.8 : 1.3)
            
            .animation(.interpolatingSpring(stiffness: 170, damping: 8), value: isTappedImage)
            .onTapGesture {
                isTappedImage.toggle()
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
        UserRowView(user: UserItems(id: 1, firstName: "Fufel", lastName: "Shmerch", online: 0, photo: "https://sun9-81.userapi.com/impf/AuTPJnstCno52wllnMU-gjErwMUPpR68DPDKWw/pBVLgQkJZyw.jpg?size=1620x2160&quality=96&sign=12efab1b98a3eca4be52df2ed8f73be3&type=album", city: nil))
    }
}
