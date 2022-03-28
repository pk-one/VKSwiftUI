//
//  GetGroupOperation.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation
import Alamofire

final class GetGroupOperation: AsyncOperation {
    
    private var request: DataRequest?
    private var data: Data?
    private var error: Error?
    
    override func main() {
        request = AF.request(GroupRouter.getGroup).response(queue: DispatchQueue.global()) { [weak self] response in
            self?.data = response.data
            self?.error = response.error
            self?.state = .finished
        }
    }
    
    override func cancel() {
        request?.cancel()
        super.cancel()
    }
    
    func getData() -> Data? {
        return data
    }
    
    func getError() -> Error? {
        return error
    }
}
