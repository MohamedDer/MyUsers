//
//  File.swift
//  MyUsers
//
//  Created by Mohamed Derkaoui on 04/03/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import ObjectMapper



struct Name: Mappable {

    var title: String?
    var first: String?
    var last: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        first <- map["first"]
        last <- map["last"]
    }
    
    func getCompleteName() -> String? {
        if let title = title, let first = first,let last = last {
            return "\(title) \(first) \(last.uppercased())"
        }
        return nil
    }
}
