//
//  UIImageView+Extension.swift
//  thanks
//
//  Created by sdklt on 2015/12/25.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {

    func getCarrierWaveImageWithUrl(avatarUrl: String) {
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
            
            if self.image == nil {
                self.layer.opacity = 0
                UIView.animateWithDuration(0.2, animations: {
                    self.image = gotImage
                    self.layer.opacity = 1
                })
            } else {
                self.image = gotImage
            }
        }
    }
}
