//
//  TabBarViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTabBarItems()
        layoutTabBarItems()
    }

    func addTabBarItems() {
        addChildViewControllerWithStoryboardName("Timeline")
        childViewControllers.last?.tabBarItem = UITabBarItem(title: "TimeLine", image: nil, tag: 1)
        addChildViewControllerWithStoryboardName("MyPage")
        childViewControllers.last?.tabBarItem = UITabBarItem(title: "MyPage", image: nil, tag: 2)
    }
    
    func addChildViewControllerWithStoryboardName(storyboardName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()        
        addChildViewController(vc!)
    }

    func layoutTabBarItems() {
        tabBar.translucent = false
        tabBar.tintColor = UIColor.deepGrayColor()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: UIFont.standardFontName(), size: 14)!], forState: .Normal)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0, -6)
    }
    
}

