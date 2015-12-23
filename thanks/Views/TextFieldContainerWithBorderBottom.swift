//
//  TextFieldContainerWithBorderBottom.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

@IBDesignable final
class TextFieldContainerWithBorderBottom: UIView {

    @IBInspectable var trigger: Bool = true {
        didSet {
            setup()
        }
    }
    
    private func setup() {
        let borderBottom = CALayer()
        let borderWidth: CGFloat = 1
        
        borderBottom.removeFromSuperlayer()
        borderBottom.frame = CGRectMake(0, frame.height - borderWidth, frame.width, borderWidth)
        borderBottom.backgroundColor = UIColor.veryLightGrayColor().CGColor
        layer.addSublayer(borderBottom)
    }

}