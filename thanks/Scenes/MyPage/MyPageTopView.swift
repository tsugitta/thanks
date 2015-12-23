//
//  MyPageTopView.swift
//  thanks
//
//  Created by sdklt on 2015/12/22.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

protocol MyPageTopViewDelegate: class {
    //    func timelineTopViewDidTapCenterButton(timelineTopView: TimelineTopView)
}

class MyPageTopView: UIView {

    weak var delegate: MyPageTopViewDelegate!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.registerNib(UINib(nibName: "MyPageHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "MyPageHeaderTableViewCell")
        tableView.registerNib(UINib(nibName: "MyPageThanksTableViewCell", bundle: nil), forCellReuseIdentifier: "MyPageThanksTableViewCell")
        layoutTableView()
    }
    
    func layoutTableView() {
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
    }

}
