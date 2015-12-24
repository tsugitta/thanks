//
//  SearchView.swift
//  thanks
//
//  Created by sdklt on 2015/12/24.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class SearchView: UIView {

    @IBOutlet weak var tableView: UITableView!

    override func awakeFromNib() {
        tableView.registerNib(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        tableView.separatorStyle = .None
    }
    
}
