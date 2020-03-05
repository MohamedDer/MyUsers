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
        edgesForExtendedLayout = []
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
        view.addSubview(stackView)
        stackView.rightAnchor.constraint(equalToSystemSpacingAfter: view.rightAnchor, multiplier: 1).isActive = true
        stackView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 1).isActive = true
        stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 1.5).isActive = true


    }

}
