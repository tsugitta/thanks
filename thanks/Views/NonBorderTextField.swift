//
//  NonBorderTextField.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

@IBDesignable final
class NonBorderTextField: UITextField {
    
    @IBInspectable var trigger: Bool = true {
        didSet {
            setup()
        }
    }

    private func setup() {
        borderStyle = .None
        textAlignment = .Center
        textColor = UIColor.lightGrayColor()
//        font = font?.fontWithSize(18)
    }
    
}
