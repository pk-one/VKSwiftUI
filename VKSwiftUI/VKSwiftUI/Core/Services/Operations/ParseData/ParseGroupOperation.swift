//
//  ParseGroupOperation.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation

final class ParseGroupOperation: Operation {
    
    private let completion: ([GroupItems]) -> Void
    
    init(completion: @escaping ([GroupItems]) -> Void) {
        self.completion = completion
    }
    
    override func main() {
        guard let getGroupOperation = dependencies.first as? GetGroupOperation,
              let data = getGroupOperation.data else { return }
        
        do {
            let groups = try JSONDecoder().decode(Group.self, from: data)
            completion(groups.response.items)
        } catch let jsonError {
            print(jsonError)
        }
    }
}
