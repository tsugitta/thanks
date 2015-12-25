//
//  SignInTextField.swift
//  thanks
//
//  Created by sdklt on 2015/12/25.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

@IBDesignable final
class SignInTextField: UITextField {
    
    @IBInspectable var trigger: Bool = true {
        didSet {
            setup()
        }
    }
    
    private func setup() {
        borderStyle = .None
        textColor = UIColor.deepGrayColor()
    }
    
}
