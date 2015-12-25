//
//  AuthTopView.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class AuthTopView: UIView {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        titleLabel.font = UIFont(name: "Avenir-Heavy", size: 17)
    }

}
