//
//  GetPhotosUserOperation.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation
import Alamofire

final class GetPhotosUserOperation: AsyncOperation {
    
    private var request: DataRequest?
    private var ownerId: Int?
    
    var data: Data?
    var error: Error?
    
    init(ownerId: Int) {
        self.ownerId = ownerId
    }
    
    override func main() {
        request = AF.request(UserRouter.getPhotosFriend(ownerId: ownerId!)).response(queue: DispatchQueue.global()) { [weak self] response in
            self?.data = response.data
            self?.error = response.error
            self?.state = .finished
        }
    }
    
    override func cancel() {
        request?.cancel()
        super.cancel()
    }
}
