//
//  UserTableViewCell.swift
//  MyUsers
//
//  Created by Mohamed on 05/03/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    var user : User? {
        didSet {
            userImageView.setupImageFrom(stringURL: user?.profilePicture?.thumbnail)
            nameLabel.text =  user?.name?.getCompleteName()
        }
    }
    
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let userImageView : ProfileImageView = {
        let imgView = ProfileImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        let stackView = UIStackView(arrangedSubviews: [userImageView,nameLabel])
        stackView.frame = bounds
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 15
        addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


}
