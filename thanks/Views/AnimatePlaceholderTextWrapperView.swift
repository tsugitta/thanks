//
//  SignInTextWrapperView.swift
//  thanks
//
//  Created by sdklt on 2015/12/25.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

@IBDesignable final
class AnimatePlaceholderTextWrapperView: UIView {
    var textLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(textLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        textLabel.frame = frame
        textLabel.font = UIFont(name: UIFont.standardFontName(), size: 15)
        textLabel.textColor = UIColor.grayColor()
    }
    
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
        borderBottom.backgroundColor = UIColor.lightGrayColor().CGColor
        layer.addSublayer(borderBottom)
    }
    
}