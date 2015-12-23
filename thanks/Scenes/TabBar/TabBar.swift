//
//  TabBar.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class TabBar: UITabBar {
    
    // in order to change the tabbar's height
    override func sizeThatFits(size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 35
        return size
    }
    
}
