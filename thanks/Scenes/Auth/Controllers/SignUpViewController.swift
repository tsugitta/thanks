//
//  SignUpViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/18.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    private let mModel = SignUpViewModel()
    private var mView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView = view as! SignUpView
        mView.signUpButton.addTarget(self, action: "clickSignUpButton:", forControlEvents: .TouchUpInside)
        
        mView.idTextField.delegate = self
        mView.nameTextField.delegate = self
        mView.passwordTextField.delegate = self
        
//        let tapGesture = UIGestureRecognizer(target: self, action: "didClickView:")
//        view.addGestureRecognizer(tapGesture)
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
        auth.signUp(completion: {
            self.segueToTabBarViewController()
        })
    }
    
    func inputsAreValid() -> Bool {
        return
            mView.idTextField.text.isNotBlank &&
            mView.nameTextField.text.isNotBlank &&
            mView.passwordTextField.text.isNotBlank
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        let wrapperView = textField.superview as! SignInTextWrapperView
//        let frame = wrapperView.textLabel.frame
//        let newY: CGFloat = textField.text.isBlank ? 0 : -20
//        
//        UIView.animateWithDuration(0.2, animations: {
//            wrapperView.textLabel.frame = CGRect(x: frame.origin.x, y: newY, width: frame.width, height: frame.height)
//        })
//        return true
//    }
    
    func didClickView(sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
    
    func segueToTabBarViewController() {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
        vc.modalTransitionStyle = .CrossDissolve
        presentViewController(vc, animated: true, completion: nil)
    }

}
