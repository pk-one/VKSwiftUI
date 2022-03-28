//
//  GroupRouter.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation
import Alamofire

enum GroupRouter: URLRequestConvertible {
    
    case getGroup
    
    private var token: String {
        return SessionInfo.shared.token
    }
    
    private var url: URL {
        return URL(string: "https://api.vk.com/method")!
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getGroup: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getGroup: return "/groups.get"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getGroup: return [
            "access_token" : token,
            "fields" : "activity",
            "extended" : 1,
            "v" : "5.131"]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = url.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        print(token)
        return try URLEncoding.default.encode(request, with: parameters)
    }
}



