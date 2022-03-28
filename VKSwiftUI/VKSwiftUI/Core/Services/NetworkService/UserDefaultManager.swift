//
//  SessionInfo.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 28.03.2022.
//

import Foundation

enum UserDefaultsKeys: String {
     case userToken
 }

final class UserDefaultManager {
    private init() { }
    
    static let shared = UserDefaultManager()
    
    private var userDefaults: UserDefaults {
            UserDefaults.standard
        }
    
    //MARK: - User info
    var userToken: String? {
        get {
            userDefaults.string(forKey: UserDefaultsKeys.userToken.rawValue)
        }
        
        set {
            userDefaults.set(newValue, forKey: UserDefaultsKeys.userToken.rawValue)
        }
    }
}
