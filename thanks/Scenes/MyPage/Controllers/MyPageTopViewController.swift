//
//  MyPageTopViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/22.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class MyPageTopViewController: UIViewController, UITableViewDelegate, MyPageTopViewModelDelegate, UserEditViewControllerDelegate {
    
    private let mModel = MyPageTopViewModel()
    private var mView: MyPageTopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView = view as! MyPageTopView
        mView.tableView.dataSource = mModel
        mView.tableView.delegate = self
        mModel.delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        mView.tableView.reloadData()
    }
    
    func myPageTopViewModelDidClickUserEditButton(myPageTopViewModel: MyPageTopViewModel) {
        performSegueWithIdentifier("FromMyPageTopToUserEdit", sender: self)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return mModel.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "FromMyPageTopToUserEdit":
            let userEditNavigationVC = segue.destinationViewController as! NavigationController
            let userEditVC = userEditNavigationVC.viewControllers.first as! UserEditViewController
            userEditVC.delegate = self
        default:
            break
        }
    }
    
    func userEditViewControllerDidUpload(userEditViewController: UserEditViewController) {
        mView.tableView.reloadData()
    }
}
