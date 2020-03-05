//
//  ProfileImageView.swift
//  MyUsers
//
//  Created by Mohamed on 05/03/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import UIKit
import Kingfisher


class ProfileImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupImageFrom(stringURL: String?) {
        if let stringURL = stringURL, let url = URL(string: stringURL) {
            self.kf.setImage(with: url)
        }
    }
    
}
