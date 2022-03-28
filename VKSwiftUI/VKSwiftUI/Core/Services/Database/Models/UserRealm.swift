//
//  UserRealm.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 28.03.2022.
//

import Foundation
import RealmSwift


class UserRealm: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var online: Int
    @Persisted var photo: String
    @Persisted var city: String?
   
    
    convenience init(_ model: UserItems) {
        self.init()
        self.id = model.id
        self.firstName = model.firstName
        self.lastName = model.lastName
        self.online = model.online
        self.photo = model.photo
        self.city = model.city?.title
    }
}
