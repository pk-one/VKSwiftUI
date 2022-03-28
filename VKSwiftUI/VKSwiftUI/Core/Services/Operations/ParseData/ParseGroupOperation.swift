//
//  ParseGroupOperation.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation

final class ParseGroupOperation: Operation {
    
    private let completion: (Result<[GroupItems], Error>) -> Void
    
    init(completion: @escaping (Result<[GroupItems], Error>) -> Void) {
        self.completion = completion
    }
    
    override func main() {
        guard let getGroupOperation = dependencies.first as? GetGroupOperation,
              let data = getGroupOperation.getData() else {
            if let group = dependencies.first as? GetGroupOperation,
                let error = group.getError() {
                completion(.failure(error))
            }
            return
        }
        
        do {
            let groups = try JSONDecoder().decode(Group.self, from: data)
            completion(.success(groups.response.items))
        } catch {
                completion(.failure(error))
        }
    }
}
