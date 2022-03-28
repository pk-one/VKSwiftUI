//
//  GetFriendsOperation.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation
import Alamofire

final class GetUserOperation: AsyncOperation {
    
    private var request: DataRequest?
    var data: Data?
    var error: Error?
    
    override func main() {
        request = AF.request(UserRouter.getFriends).response(queue: DispatchQueue.global()) { [weak self] response in
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
