//
//  AvatarButton.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class AvatarButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutAvatarButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutAvatarButton()
    }
    
    func layoutAvatarButton() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
        setBackgroundColor(UIColor.lightGrayColor(), forUIControlState: .Normal)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
}