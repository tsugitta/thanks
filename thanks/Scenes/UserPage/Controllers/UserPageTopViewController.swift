//
//  UserPageViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/25.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class UserPageTopViewController: UIViewController, UITableViewDelegate, UserPageTopViewModelDelegate {
    
    private let mModel = UserPageTopViewModel()
    private var mView: UserPageTopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mModel.delegate = self
        mView = view as! UserPageTopView
        mView.tableView.dataSource = mModel
        mView.tableView.delegate = self
        
        let user = UserManager.sharedInstance.showingUser
        UserManager.sharedInstance.fetchUserWithUserId(user.id, completion: {
            self.mView.tableView.reloadData()
        })
        
        layoutNavigationBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        mView.tableView.reloadData()
    }
    
    func layoutNavigationBar() {
        let backImage = UIImage(named: "Back-100")?.resize(afterWidth: 22, afterHeight: 22)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style: .Plain, target: self, action: "goBack:")
        
        navigationItem.title = UserManager.sharedInstance.showingUser.name
    }
    
    func myPageTopViewModelDidClickUserFollowButton(myPageTopViewModel: MyPageTopViewModel) {
        performSegueWithIdentifier("FromMyPageTopToUserEdit", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return mModel.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    func userPageTopViewModelDidUpdateFollowingStatus(userPageTopViewModel: UserPageTopViewModel) {
        mView.tableView.reloadData()
    }
    
    func goBack(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }

}
