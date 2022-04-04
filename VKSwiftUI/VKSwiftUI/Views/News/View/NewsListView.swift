//
//  NewsListView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 14.03.2022.
//

import SwiftUI

struct NewsListView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        NavigationView {
            List(self.viewModel.news) { news in
                Section {
                    NewsRow(news: news)
                        .listRowInsets(EdgeInsets())
//                        .listRowSeparator(.hidden)
//                    //
//                        .buttonStyle(PlainButtonStyle())
                    //                    .listRowBackground(Color.clear)
                }
            }
            
            
            
            .listStyle(.grouped)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.viewModel.getNewsData()
            }
            .alert("Error", isPresented: $viewModel.isErrorShow) {
                EmptyView()
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
        
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(viewModel: NewsViewModel())
    }
}

