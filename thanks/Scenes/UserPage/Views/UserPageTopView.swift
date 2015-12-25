//
//  UserPageView.swift
//  thanks
//
//  Created by sdklt on 2015/12/25.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class UserPageTopView: UIView {

    @IBOutlet weak var tableView: UITableView!

    override func awakeFromNib() {
        tableView.registerNib(UINib(nibName: "UserPageHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "UserPageHeaderTableViewCell")
        tableView.registerNib(UINib(nibName: "ThanksTableViewCell", bundle: nil), forCellReuseIdentifier: "ThanksTableViewCell")
        layoutTableView()
    }
    
    func layoutTableView() {
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
}
