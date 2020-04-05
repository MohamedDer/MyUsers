//
//  User.swift
//  MyUsers
//
//  Created by Mohamed Derkaoui on 04/03/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var gender: String?
    var name: Name?
    var profilePicture: Picture?
    var phone: String?
    var email: String?

    required init?(map _: Map) {}

    func mapping(map: Map) {
        gender <- map["gender"]
        name <- map["name"]
        profilePicture <- map["picture"]
        phone <- map["phone"]
        email <- map["email"]
    }
}
