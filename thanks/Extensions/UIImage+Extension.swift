//
//  UIImage+Extension.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

extension UIImage {
 
    func resize(afterWidth afterWidth: CGFloat, afterHeight: CGFloat) -> UIImage {
        let size = CGSize(width: afterWidth, height: afterHeight)
        UIGraphicsBeginImageContext(size)
        drawInRect(CGRectMake(0, 0, size.width, size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
}