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
    
    var news: NewsItems
    
    @State private var isShowMoreText: Bool = false
    
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
            Image("group-1")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            VStack(alignment: .leading) {
                Text("Рыбалка в Калининграде - Калининградский рыболов")
                    .lineLimit(1)
                    .font(.headline)
                    .foregroundColor(Color("spTitleText"))
                
                Text(DateFormatter.postFormatter.string(from: news.date))
                    .lineLimit(1)
                    .font(.subheadline)
            }
        }
        .padding(.horizontal, 10)
    }
    
    private var textNews: some View {
        VStack(alignment: .leading) {
//            ExpandableText(text: news.text ?? "")
//                        .font(.body)//optional
//                        .foregroundColor(.primary)//optional
//                        .lineLimit(3)//optional
//            if let text = news.text {
//                if !isShowMoreText && text.count > 200 {
//                    Button {
//                        isShowMoreText = true
//                    } label: {
//                        Text("Показать полность...")
//                    }
//                }
//            }
        }
        .padding(.horizontal, 10)
    }
    
    private var imageNews: some View {
        HStack {
            if let postImageUrl = URL(string: news.attachments?.first?.photo?.sizes.last?.url ?? "") {
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
                    
                    Text("\(news.likes?.count ?? 0)")
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
                    
                    Text("\(news.comments?.count ?? 0)")
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
                    
                    Text("\(news.reposts?.count ?? 0)")
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
                Text("\(news.views?.count ?? 0)")
                    .foregroundColor(Color("spLightGray"))
                    .font(.subheadline)
            }
        }
        .padding(.horizontal, 10)
    }
}


struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(news: NewsItems(id: 1, sourceId: 123, date: Date(), text: "test", attachments: nil, comments: NewsItems.Comments(count: 10) , likes: nil, reposts: nil , views: nil))
    }
}

//Divider().background(color) }.padding(horizontalPadding
