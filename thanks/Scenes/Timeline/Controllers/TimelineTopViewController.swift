//
//  TimelineTopViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class TimelineTopViewController: UIViewController, TimelineTopViewDelegate, UITableViewDelegate {

    private let mModel = TimelineTopViewModel()
    private var mView: TimelineTopView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView = view as! TimelineTopView
        mView.delegate = self
        mView.tableView.dataSource = mModel
        mView.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func timelineTopViewDidTapCenterButton(timelineTopView: TimelineTopView) {
        performSegueWithIdentifier("HogeSegue", sender: self)
    }
    
}
