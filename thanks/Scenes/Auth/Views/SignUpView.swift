//
//  SignUpView.swift
//  thanks
//
//  Created by sdklt on 2015/12/18.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class SignUpView: UIView {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func awakeFromNib() {
        idTextField.keyboardType = .ASCIICapable
        passwordTextField.secureTextEntry = true

        let idTextFieldWrapperView = idTextField.superview as! AnimatePlaceholderTextWrapperView
        let nameTextFieldWrapperView = nameTextField.superview as! AnimatePlaceholderTextWrapperView
        let passwordTextFieldWrapperView = passwordTextField.superview as! AnimatePlaceholderTextWrapperView
        
        idTextFieldWrapperView.textLabel.text = "USER ID"
        nameTextFieldWrapperView.textLabel.text = "USER NAME"
        passwordTextFieldWrapperView.textLabel.text = "PASSWORD"
    }
    
}
