//
//  TimelineTopViewModel.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import Alamofire

class TimelineTopViewModel: NSObject, UITableViewDataSource {
    
    let thankManager = ThankManager.sharedInstance
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thankManager.thanks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimelineThanksTableViewCell", forIndexPath: indexPath) as! TimelineThanksTableViewCell
        let thank = thankManager.thanks[indexPath.row]
        cell.userNameLabel.text = thank.user.name
        cell.toWhomLabel.text = thank.toWhom
        cell.toWhatLabel.text = thank.toWhat
        
        if let avatarUrl = thank.user.avatarUrl {
            cell.userImageView.getCarrierWaveImageWithUrl(avatarUrl)
        } else {
            cell.userImageView.image = UIImage(named: "NoImage")
        }

        return cell
    }
    
}
