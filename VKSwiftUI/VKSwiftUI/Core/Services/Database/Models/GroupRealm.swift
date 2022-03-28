//
//  GroupRealm.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 28.03.2022.
//

import Foundation
import RealmSwift

class GroupRealm: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var photo: String
    @Persisted var activity: String?
    
    convenience init(_ model: GroupItems) {
        self.init()
        self.id = model.id
        self.name = model.name
        self.photo = model.photo
        self.activity = model.activity
    }
}
