//
//  File.swift
//  MyUsers
//
//  Created by Mohamed Derkaoui on 04/03/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import ObjectMapper



struct Picture: Mappable {

    var large: String?
    var medium: String?
    var thumbnail: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        large <- map["large"]
        medium <- map["medium"]
        thumbnail <- map["thumbnail"]
    }
    
}
