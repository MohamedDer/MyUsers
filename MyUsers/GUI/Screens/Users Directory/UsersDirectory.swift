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

    var usersTableView: UITableView = UITableView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users Directory"
        setupUsersTableView()
        setupbinding()
        userViewModel.fetchUsers()
    }


    
    fileprivate func setupUsersTableView() {
        usersTableView.frame = view.bounds
        usersTableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        usersTableView.separatorStyle = .none
        view.addSubview(usersTableView)
    }
    
    fileprivate func setupbinding() {

        //        userViewModel.loading.bind(to: self.testV.rx.isHidden).disposed(by: disposeBag)
        userViewModel
                   .error
                   .observeOn(MainScheduler.instance)
                   .subscribe(onNext: { (error) in
                    //TO DO Show error in pop-up
                        print(error)
                   })
                   .disposed(by: disposeBag)

        userViewModel
            .users
            .observeOn(MainScheduler.instance)
            .bind(to: users)
            .disposed(by: disposeBag)

        users.bind(to: usersTableView.rx.items(cellIdentifier: "UserTableViewCell", cellType: UserTableViewCell.self)) {  (row,user,cell) in
            cell.user = user
        }.disposed(by: disposeBag)

        usersTableView.rx.modelSelected(User.self)
        .subscribe(onNext: { [weak self] user in
           let detailVC = UserDetailViewController()
            detailVC.user = user
            detailVC.modalPresentationStyle = .fullScreen
            self?.navigationController?.pushViewController(detailVC, animated: false)
        }).disposed(by: disposeBag)
    }
    
}

