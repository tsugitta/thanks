//
//  TimelineTopView.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

protocol TimelineTopViewDelegate: class {
//    func timelineTopViewDidTapCenterButton(timelineTopView: TimelineTopView)
}

class TimelineTopView: UIView {

    weak var delegate: TimelineTopViewDelegate!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        tableView.registerNib(UINib(nibName: "TimelineThanksTableViewCell", bundle: nil), forCellReuseIdentifier: "TimelineThanksTableViewCell")
    
        layoutTableView()
    }
    
    func layoutTableView() {
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
