//
//  TimelineTopView.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class TimelineTopView: UIView {

    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        tableView.registerNib(UINib(nibName: "ThanksTableViewCell", bundle: nil), forCellReuseIdentifier: "ThanksTableViewCell")
    
        layoutTableView()
        
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
    }
    
    func layoutTableView() {
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
}
