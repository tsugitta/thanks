//
//  UserEditView.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class UserEditView: UIView {

    @IBOutlet weak var thanksIdTextField: UITextField!
    @IBOutlet weak var displayedNameTextField: UITextField!
    @IBOutlet weak var profileTextField: UITextField!
    @IBOutlet weak var userAvatarButton: AvatarButton!

    override func awakeFromNib() {
        let user = CurrentUser.sharedInstance.user!
        thanksIdTextField.text = user.thanksId
        displayedNameTextField.text = user.name
        profileTextField.text = user.profile

        if let avatar = user.avatar {
            userAvatarButton.setBackgroundImage(avatar, forState: .Normal)
            userAvatarButton.setTitle("", forState: .Normal)
        }
    }
    
}
