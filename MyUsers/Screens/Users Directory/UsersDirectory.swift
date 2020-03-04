//
//  ViewController.swift
//  MyUsers
//
//  Created by Mohamed Derkaoui on 04/03/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class UsersDirectoryViewController: UIViewController {
    
    var userViewModel = UsersViewModel()
    public var users = PublishSubject<[User]>()
    let disposeBag = DisposeBag()

    var testV = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup views
        
        testV.bounds = self.view.bounds
        testV.backgroundColor = .red
        view.addSubview(testV)
        let usersNumberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100))
        usersNumberLabel.backgroundColor = .yellow
        usersNumberLabel.text = "dada"
        self.view.addSubview(usersNumberLabel)
        
        //Setup Binding

        userViewModel.loading
            .bind(to: self.testV.rx.isHidden).disposed(by: disposeBag)
        
        
        userViewModel
                   .error
                   .observeOn(MainScheduler.instance)
                   .subscribe(onNext: { (error) in
                        print("dadada"+error)
                   })
                   .disposed(by: disposeBag)
        
        userViewModel
            .users
            .observeOn(MainScheduler.instance)
            .bind(to: users)
            .disposed(by: disposeBag)
    
    
        userViewModel.fetchUsers()
    }


}

