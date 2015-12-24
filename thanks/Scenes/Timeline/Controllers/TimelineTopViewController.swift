//
//  TimelineTopViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class TimelineTopViewController: UIViewController, PostViewControllerDelegate, UITableViewDelegate {

    private let mModel = TimelineTopViewModel()
    private var mView: TimelineTopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ThankManager.sharedInstance.fetchThanks(completion: {
            self.mView.tableView.reloadData()
        })

        mView = view as! TimelineTopView
        mView.tableView.dataSource = mModel
        mView.tableView.delegate = self
        
        layoutNavigationBar()
    }

    func layoutNavigationBar() {
        let deleteImage = UIImage(named: "AddUser-100")?.resize(afterWidth: 22, afterHeight: 22)
        let checkImage = UIImage(named: "Edit-100")?.resize(afterWidth: 22, afterHeight: 22)
        
        let leftButton = UIBarButtonItem(image: deleteImage, style: .Plain, target: self, action: "clickAddUserButton:")
        let rightButton = UIBarButtonItem(image: checkImage, style: .Plain, target: self, action: "clickPostButton:")
        
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func clickPostButton(sender: UIBarButtonItem) {
        performSegueWithIdentifier("FromTimelineTopToPost", sender: self)
    }

    func clickAddUserButton(sender: UIBarButtonItem) {
        performSegueWithIdentifier("FromTimelineTopToSearch", sender: self)
    }
    
    func postViewControllerDidPostThank(postViewController: PostViewController) {
        mView.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "FromTimelineTopToPost":
            let postNavigationVC = segue.destinationViewController as! NavigationController
            let postVC = postNavigationVC.viewControllers.first as! PostViewController
            postVC.delegate = self
        default:
            break
        }
    }

}
