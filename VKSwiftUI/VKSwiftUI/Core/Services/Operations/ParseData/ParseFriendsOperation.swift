//
//  ParseFriendsOperation.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation

final class ParseUserOperation: Operation {
    
    private let completion: (Result<[UserItems], Error>) -> Void
    
    init(completion: @escaping (Result<[UserItems], Error>) -> Void) {
        self.completion = completion
    }
    
    override func main() {
        
        guard let getUserOperation = dependencies.first as? GetUserOperation,
              let data = getUserOperation.getData() else {
            if let user = dependencies.first as? GetUserOperation,
               let error = user.getError() {
                completion(.failure(error))
            }
            return
        }
        
        do {
            let users = try JSONDecoder().decode(User.self, from: data)
            completion(.success(users.response.items))
        } catch {
            completion(.failure(error))
        }
    }
}
