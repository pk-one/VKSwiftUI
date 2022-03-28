//
//  UserPhotoAlbumView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 24.03.2022.
//

import SwiftUI
import Kingfisher

struct FriendPhotoAlbumView: View {
    
    private enum Constant {
        static let imageWidth = screen.width / 3
    }
    
    @ObservedObject var viewModel: FriendPhotoAlbumViewModel
     
    private let firstGrid = GridItem(.adaptive(minimum: Constant.imageWidth), spacing: 0)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [firstGrid], spacing: 0) {
                ForEach(viewModel.photos) { photo in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        let url = URL(string: photo.image.first?.url ?? "")
                        KFImage(url)
                            .cancelOnDisappear(true)
                            .resizable()
                            .scaledToFill()
                            .frame(width: Constant.imageWidth, height: Constant.imageWidth)
                            .clipped()
                            .border(.black)
                    }
                }
            }
        }
        .navigationTitle(viewModel.fullName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getUserPhotos()
        }
    }
}
//
//struct UserPhotoAlbumView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendPhotoAlbumView()
//    }
//}
