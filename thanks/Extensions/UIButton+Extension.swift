//
//  UIButton+Extension.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import Alamofire

extension UIButton {
    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setBackgroundColor(color: UIColor, forUIControlState state: UIControlState) {
        self.setBackgroundImage(imageWithColor(color), forState: state)
    }
    
    func setCarrierWaveImageWithUrl(avatarUrl: String) {
        getImageAsynchronouslyWithUrl("\(Settings.ApiRootPath)\(avatarUrl)") // CarrierWave's avatar_url includes initial slash
    }
    
    func getImageAsynchronouslyWithUrl(urlString: String) {
        Alamofire.request(
            .GET,
            urlString,
            headers: ["AuthToken": Auth.sharedInstance.authToken!]
            ).response { _, _, data, error in
                let gotImage: UIImage
                if let imageFromData = UIImage(data: data!) {
                    gotImage = imageFromData
                    
                } else {
                    gotImage = UIImage(named: "NoImage")!
                }
                self.setBackgroundImage(gotImage, forState: .Normal)
        }
    }
    
}