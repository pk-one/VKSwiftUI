//
//  NewsViewModel.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 29.03.2022.
//

import Foundation
import RealmSwift

final class NewsViewModel: ObservableObject {
    
    private let networkService = DataOperation()
    
    @Published private(set) var news = [NewsItems]()
    @Published var isErrorShow: Bool = false
    
    private(set) var errorMessage: String?
    
    //MARK: - Methods
    func getNewsData() {
        networkService.getNewsData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(news):
                self.news = news
            case let .failure(error):
                self.showError(error: error)
            }
        }
    }
    
    private func showError(error: Error) {
        errorMessage = error.localizedDescription
        isErrorShow = true
    }
}
