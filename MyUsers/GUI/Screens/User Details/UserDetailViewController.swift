//
//  UserDetailViewController.swift
//  MyUsers
//
//  Created by Mohamed on 05/03/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var user: User?
    
    var firstNameLabel = UILabel()
    var lastNameLabel = UILabel()
    var emailLabel = UILabel()
    var phoneLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // Setup  image
        let pictureImageView = ProfileImageView(frame: CGRect())
        pictureImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        pictureImageView.setupImageFrom(stringURL: user?.profilePicture?.large)
        view.addSubview(pictureImageView)
        
        // Setup labels
        firstNameLabel.text = user?.name?.first
        lastNameLabel.text = user?.name?.last
        emailLabel.text = user?.email
        phoneLabel.text = user?.phone
        
        
        // stack
        let stackView = UIStackView(arrangedSubviews: [pictureImageView,firstNameLabel,lastNameLabel,emailLabel,phoneLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.distribution = .fill
               stackView.axis = .vertical
               stackView.spacing = 20
               stackView.frame = CGRect(x: 0, y: 50, width: view.bounds.width, height: 200)
        view.addSubview(stackView)
        
        // Return button

    }

}
