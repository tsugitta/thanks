//
//  NavigationController.swift
//  thanks
//
//  Created by sdklt on 2015/12/24.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutNavigationBar()
    }

    func layoutNavigationBar() {
        navigationBar.translucent = false
        navigationBar.barTintColor = UIColor.lightOrangeColor()
        navigationBar.tintColor = UIColor.deepGrayColor()
        navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: UIFont.standardFontName(), size: 14)!,
            NSForegroundColorAttributeName:UIColor.deepGrayColor()
        ]
    }
    
}
