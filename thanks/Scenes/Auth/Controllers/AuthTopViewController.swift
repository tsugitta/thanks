//
//  AuthTopViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class AuthTopViewController: UIViewController {
    
    private let mModel = AuthTopViewModel()
    private var mView: AuthTopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView = view as! AuthTopView
        mView.signUpButton.addTarget(self, action: "clickSignUpButton:", forControlEvents: .TouchUpInside)
        mView.signInButton.addTarget(self, action: "clickSignInButton:", forControlEvents: .TouchUpInside)
    }
    
    func clickSignUpButton(sender: AuthTopView) {
        performSegueWithIdentifier("FromAuthTopToSignUp", sender: self)
    }
    
    func clickSignInButton(sender: AuthTopView) {
        performSegueWithIdentifier("FromAuthTopToSignIn", sender: self)
    }
    
}
