//
//  NewsRowViewModel.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 04.04.2022.
//

import Foundation

final class NewsRowViewModel {
    
    private let databaseService: DatabaseService = DatabaseServiceImplementation()
    
    var news: NewsItems
    private lazy var groups = try? databaseService.get(GroupRealm.self)
    private lazy var users = try? databaseService.get(UserRealm.self)
    
    init(news: NewsItems) {
        self.news = news
    }
    
    var post: Post? {
        guard let groups = groups, let users = users else { return nil }
        if news.sourceId < 0 {
            var idNews = news.sourceId
            idNews.negate()
            for ind in 0..<groups.count where idNews == groups[ind].id {
                guard let urlPhoto = URL(string: groups[ind].photo) else { fatalError("Failed load photo")}
                let name = groups[ind].name
                return Post(photoOwnerPost: urlPhoto, nameOwnerPost: name, bodyPost: news)
            }
        } else {
            for ind in 0..<users.count where news.sourceId == users[ind].id {
                guard let urlPhoto = URL(string: users[ind].photo) else { fatalError("Failed load photo")}
                let name = users[ind].firstName + " " + users[ind].lastName
                return Post(photoOwnerPost: urlPhoto, nameOwnerPost: name, bodyPost: news)
            }
        }
        return nil
    }
}
