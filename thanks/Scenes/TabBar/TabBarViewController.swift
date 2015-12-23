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
//        let font:UIFont! = UIFont(name:"HelveticaNeue-Bold",size:10)
//
//        let normalAttributes: NSDictionary! = [NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.lightGrayColor()]
//        let selectedAttributes: NSDictionary! = [NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.black]
//        
//        let selectedAttributes: NSDictionary! = [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor(red:0.13, green:0.55, blue:0.83, alpha:1.0)]
//
//        navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: UIFont.standardFontName(), size: 14)!]
        tabBar.tintColor = UIColor.deepGrayColor()

        for item in tabBar.items! {
            item.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
            item.setTitleTextAttributes([NSFontAttributeName: UIFont(name: UIFont.standardFontName(), size: 14)!], forState: .Normal)

        }
    }
    
}

