//
//  UserFetcherService.swift
//  MyUsers
//
//  Created by Mohamed Derkaoui on 04/03/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


class UserFetcherService {
    
    fileprivate var _shared: UserFetcherService?
    var shared: UserFetcherService {
        get {
            if let shared = _shared {
                return shared
            } else {
                let shared = UserFetcherService()
                _shared = shared
                return shared
            }
        }
        set {
            _shared = newValue
        }
    }

    // TO DO : Implement a separate User fetching service, outside the viewModel
    
}


