//
//  NewsRow.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 29.03.2022.
//

import SwiftUI
import Kingfisher
import ExpandableText

struct NewsRow: View {
    
    var viewModel: NewsRowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            headerNews
            textNews
            imageNews
            
            Divider()
                .padding(.horizontal, 10)
            
            bottomNews
        }
    }
    
    private var headerNews: some View {
        HStack {
            KFImage(viewModel.post?.photoOwnerPost)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            VStack(alignment: .leading) {
                Text(viewModel.post?.nameOwnerPost ?? "")
                    .lineLimit(1)
                    .font(.headline)
                    .foregroundColor(Color("spTitleText"))
                
                Text(DateFormatter.postFormatter.string(from: viewModel.post?.bodyPost.date ?? Date()))
                    .lineLimit(1)
                    .font(.subheadline)
            }
        }
        .padding(.horizontal, 10)
        .padding(.top, 5)
    }
    
    private var textNews: some View {
        VStack(alignment: .leading) {
            ExpandableText(text: viewModel.post?.bodyPost.text ?? "")
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .expandAnimation(.easeInOut)
                        .expandButton(TextSet(text: "Показать больше...", font: .body, color: .blue))
        }
        .padding(.horizontal, 10)
    }
    
    private var imageNews: some View {
        HStack {
            if let postImageUrl = URL(string: viewModel.post?.bodyPost.attachments?.first?.photo?.sizes.last?.url ?? "") {
                KFImage(postImageUrl)
                .resizable()
                .scaledToFit()
            }
        }
    }
    
    private var bottomNews: some View {
        HStack {
            Button {
               
            } label: {
                HStack {
                    Image(systemName: "suit.heart")
                        .foregroundColor(Color("spLightGray"))
                    
                    Text("\(viewModel.post?.bodyPost.likes?.count ?? 0)")
                        .foregroundColor(Color("spLightGray"))
                        .font(.subheadline)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(Color("spBgButton"))
            .cornerRadius(40)
            
            
            Button {
                
                
            } label: {
                HStack {
                    Image(systemName: "message")
                        .foregroundColor(Color("spLightGray"))
                    
                    Text("\(viewModel.post?.bodyPost.comments?.count ?? 0)")
                        .foregroundColor(Color("spLightGray"))
                        .font(.subheadline)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(Color("spBgButton"))
            .cornerRadius(40)
            
            Button {
            } label: {
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                        .foregroundColor(Color("spLightGray"))
                    
                    Text("\(viewModel.post?.bodyPost.reposts?.count ?? 0)")
                        .foregroundColor(Color("spLightGray"))
                        .font(.subheadline)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(Color("spBgButton"))
            .cornerRadius(40)
            
            Spacer()
            
            HStack {
                Image(systemName: "eye.fill")
                    .foregroundColor(Color("spLightGray"))
                Text("\(viewModel.post?.bodyPost.views?.count ?? 0)")
                    .foregroundColor(Color("spLightGray"))
                    .font(.subheadline)
            }
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 5)
    }
}


//struct NewsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsRow(news: NewsItems(id: 1, sourceId: 123, date: Date(), text: "test", attachments: nil, comments: NewsItems.Comments(count: 10) , likes: nil, reposts: nil , views: nil))
//    }
//}

//Divider().background(color) }.padding(horizontalPadding
