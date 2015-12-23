//
//  GrayButton.swift
//  thanks
//
//  Created by sdklt on 2015/12/24.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

@IBDesignable final
class GrayButton: UIButton {

    @IBInspectable var trigger: Bool = true {
        didSet {
            setup()
        }
    }
    
    private func setup() {
        layer.cornerRadius = 4
        setTitleColor(UIColor.deepGrayColor(), forState: .Normal)
        titleLabel?.font = UIFont(name: UIFont.standardFontName(), size: 10)
        backgroundColor = UIColor.veryLightGrayColor()
    }

}
