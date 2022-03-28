//
//  UserRouter.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 25.03.2022.
//

import Foundation
import Alamofire
import SwiftUI

enum UserRouter: URLRequestConvertible {
    case getFriends
    case getPhotosFriend(ownerId: Int)
    
    private var token: String {
        return UserDefaultManager.shared.userToken ?? ""
    }
    
    private var url: URL {
        return URL(string: "https://api.vk.com/method")!
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getFriends: return .get
        case .getPhotosFriend: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getFriends: return "/friends.get"
        case .getPhotosFriend: return "/photos.get"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getFriends: return [
            "access_token" : token,
            "order" : "hints",
            "fields" : "city, photo_50, online",
            "v" : "5.131" ]
            
        case .getPhotosFriend(ownerId: let ownerId): return [
            "owner_id" : ownerId,
            "access_token" : token,
            "extended" : "1",
            "album_id" : "wall",
            "v" : "5.131"
        ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = url.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
