//
//  UIFont+Extension.swift
//  thanks
//
//  Created by sdklt on 2015/12/24.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func standardFontName() -> String {
        return "Avenir-Medium"
    }
    
    class func standardize() {
        UILabel.appearance().font = UIFont(name: standardFontName(), size: 14)
        UITextField.appearance().font = UIFont(name: standardFontName(), size: 14)
    }
    
}