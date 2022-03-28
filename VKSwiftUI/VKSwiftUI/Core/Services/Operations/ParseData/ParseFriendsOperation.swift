//
//  ParseFriendsOperation.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation

final class ParseUserOperation: Operation {
    
    private let completion: ([UserItems]) -> Void
    
    init(completion: @escaping ([UserItems]) -> Void) {
        self.completion = completion
    }
    
    override func main() {
        guard let getUserOperation = dependencies.first as? GetUserOperation,
              let data = getUserOperation.data else { return }
        
        do {
            let users = try JSONDecoder().decode(User.self, from: data)
            completion(users.response.items)
        } catch let jsonError {
            print(jsonError.localizedDescription)
        }
    }
}
