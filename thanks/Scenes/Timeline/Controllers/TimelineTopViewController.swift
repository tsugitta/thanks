//
//  TimelineTopViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class TimelineTopViewController: UIViewController, TimelineTopViewDelegate, PostViewControllerDelegate, UITableViewDelegate {

    private let mModel = TimelineTopViewModel()
    private var mView: TimelineTopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ThankManager.sharedInstance.fetchThanks(completion: {
            self.mView.tableView.reloadData()
        })

        mView = view as! TimelineTopView
        mView.delegate = self
        mView.tableView.dataSource = mModel
        mView.tableView.delegate = self
        
        layoutNavigationBar()
    }

    func layoutNavigationBar() {
        let rightButton = UIBarButtonItem(title: "post", style: .Plain, target: self, action: "clickPostButton:")
        navigationItem.rightBarButtonItem = rightButton
    }

    func clickPostButton(sender: UIBarButtonItem) {
        performSegueWithIdentifier("FromTimelineTopToPost", sender: self)
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
