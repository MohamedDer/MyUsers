//
//  UsersViewModel.swift
//  MyUsers
//
//  Created by Mohamed Derkaoui on 04/03/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift
import RxCocoa


class UsersViewModel {
           
            public let users : PublishSubject<[User]> = PublishSubject()
            public let loading: PublishSubject<Bool> = PublishSubject()
            public let error : PublishSubject<String> = PublishSubject()
            private var _users = [User]()
            
            private let disposable = DisposeBag()

            public func fetchUsers(){
                
//                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    
                    self.loading.onNext(true)
                    let params = ["results": 10]
                    AF.request("https://randomuser.me/api", method: .get, parameters: params ).responseJSON { (response) in
                        switch response.result {
                        case .success:
                            let usersJsonObject = (response.value as? [String:Any])?["results"]
                            if let users = Mapper<User>().mapArray(JSONObject: usersJsonObject) {
                                self.loading.onNext(false)
                                self._users.append(contentsOf: users)
                                self.users.onNext( self._users)
                            }
                        case let .failure(error):
                            self.error.onNext(error.localizedDescription)

                        }
//                    }
                }
                
                
            }
}
