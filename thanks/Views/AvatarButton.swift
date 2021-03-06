//
//  AvatarButton.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

@IBDesignable final
class AvatarButton: UIButton {
    
    @IBInspectable var trigger: Bool = true {
        didSet {
            setup()
        }
    }
    
    private func setup() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
        setBackgroundColor(UIColor.lightGrayColor(), forUIControlState: .Normal)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
}
