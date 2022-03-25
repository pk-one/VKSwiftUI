//
//  UserPhotoAlbumView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 24.03.2022.
//

import SwiftUI

struct UserPhotoAlbumView: View {
    
    private enum Constant {
        static let imageWidth = screen.width / 3
    }
    
    var user: User
    
    private let firstGrid = GridItem(.adaptive(minimum: Constant.imageWidth), spacing: 0)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [firstGrid], spacing: 0) {
                ForEach(user.photos, id: \.self) { photo in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Image(photo)
                            .resizable()
                            .aspectRatio(calcImageAspectRatio(photo), contentMode: .fill)
                            .frame(width: Constant.imageWidth, height: Constant.imageWidth)
                            .clipped()
                            .border(.black)
                    }
                }
            }
        }
        .navigationTitle(user.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserPhotoAlbumView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotoAlbumView(user: User(avatar: "user-1-1", firstName: "Vladimir", secondName: "Ivanov", cityName: "Moskow", photos: ["user-2-1", "user-2-2", "user-2-3", "user-2-4"]))
    }
}
