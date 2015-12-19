//
//  SignUpViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/18.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    private let mModel = SignUpViewModel()
    private var mView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView = view as! SignUpView
        mView.signUpButton.addTarget(self, action: "clickSignUpButton:", forControlEvents: .TouchUpInside)
    }

    func clickSignUpButton(sender: UIButton) {
        guard inputsAreValid() else {
            // inputs are invalid.
            print("inputs are invalid")
            return
        }
        
        let input = [
            "thanksId": mView.idTextField.text!,
            "name": mView.nameTextField.text!,
            "password": mView.passwordTextField.text!,
        ]

        let auth = Auth.sharedInstance
        auth.updateProperties(input)
        auth.signUp()
        segueToTabBarViewController()
    }
    
    func inputsAreValid() -> Bool {
        return
            mView.idTextField.text.isNotBlank &&
            mView.nameTextField.text.isNotBlank &&
            mView.passwordTextField.text.isNotBlank &&
            mView.passwordTextField.text == mView.confirmationTextField.text
    }
    
    func segueToTabBarViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
        vc.modalTransitionStyle = .CrossDissolve
        presentViewController(vc, animated: true, completion: nil)
    }
}
