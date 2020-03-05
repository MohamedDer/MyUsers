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
    
    
    // MARK: BINDING
    fileprivate func setupbinding() {
        // TO DO : Add a loader view bar and bind it to loading
        //  userViewModel.loading.bind(to: loader.isAnimated).disposed(by: disposeBag)
        userViewModel.error.observeOn(MainScheduler.instance)
                   .subscribe(onNext: { (error) in
                    //TO DO Show error in pop-up
                   })
                   .disposed(by: disposeBag)

        userViewModel.users
            .observeOn(MainScheduler.instance)
            .bind(to: users)
            .disposed(by: disposeBag)

        users.bind(to: usersTableView.rx.items(cellIdentifier: "UserTableViewCell", cellType: UserTableViewCell.self)) {  (row,user,cell) in
            cell.user = user
        }.disposed(by: disposeBag)

        usersTableView.rx.modelSelected(User.self).subscribe(onNext: { [weak self] user in
           let detailVC = UserDetailViewController()
            detailVC.user = user
            detailVC.modalPresentationStyle = .fullScreen
            self?.navigationController?.pushViewController(detailVC, animated: false)
        }).disposed(by: disposeBag)
        
        usersTableView.rx.contentOffset.distinctUntilChanged().subscribe {
            if ($0.element!.y + self.usersTableView.frame.size.height > self.usersTableView.contentSize.height) {
                self.userViewModel.fetchUsers()
            }
        }.disposed(by: disposeBag)
        
    }
    
}

