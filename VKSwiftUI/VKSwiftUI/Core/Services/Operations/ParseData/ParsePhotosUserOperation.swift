//
//  ParsePhotosUserOperation.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation

final class ParsePhotosUserOperation: Operation {
    
    private let completion: ([PhotosItems]) -> Void
    
    init(completion: @escaping ([PhotosItems]) -> Void) {
        self.completion = completion
    }
    
    override func main() {
        guard let getPhotosUserOperation = dependencies.first as? GetPhotosUserOperation,
              let data = getPhotosUserOperation.data else { return }
        
        do {
            let photos = try JSONDecoder().decode(Photos.self, from: data)
            completion(photos.response.items)
        } catch let jsonError {
            print(jsonError)
        }
    }
}
