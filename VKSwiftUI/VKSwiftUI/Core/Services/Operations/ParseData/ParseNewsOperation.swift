//
//  ParseNewsOperation.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 29.03.2022.
//

import Foundation

final class ParseNewsOperation: Operation {
    
    private let completion: (Result<[NewsItems], Error>) -> Void
    
    init(completion: @escaping (Result<[NewsItems], Error>) -> Void) {
        self.completion = completion
    }
    
    override func main() {
        
        guard let getNewsOperation = dependencies.first as? GetNewsOperation,
              let data = getNewsOperation.getData() else {
            if let news = dependencies.first as? GetNewsOperation,
               let error = news.getError() {
                completion(.failure(error))
            }
            return
        }
        
        do {
            let news = try JSONDecoder().decode(News.self, from: data)
            completion(.success(news.response.items))
        } catch {
            completion(.failure(error))
        }
    }
}
