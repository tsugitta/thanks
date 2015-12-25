//
//  TimelineTopViewModel.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import Alamofire

protocol TimelineTopViewModelDelegate: class {
    
    func timelineTopViewModel(timelineTopViewModel: TimelineTopViewModel, didClickAvatarOfUser user: User)
    
}


class TimelineTopViewModel: NSObject, UITableViewDataSource {
    
    let thankManager = ThankManager.sharedInstance
    
    weak var delegate: TimelineTopViewModelDelegate!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thankManager.timelineThanks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ThanksTableViewCell", forIndexPath: indexPath) as! ThanksTableViewCell
        let thank = thankManager.timelineThanks[indexPath.row]
        cell.selectionStyle = .None
        cell.updateLabelsWithThank(thank)
        
        cell.userAvatarImageView.tag = indexPath.row
        cell.userAvatarImageView.userInteractionEnabled = true
        let clickAvatarGesture = UITapGestureRecognizer(target: self, action: "clickUserAvatar:")
        cell.userAvatarImageView.addGestureRecognizer(clickAvatarGesture)
        
        return cell
    }
    
    func clickUserAvatar(sender: UITapGestureRecognizer) {
        let user = thankManager.timelineThanks[sender.view!.tag].user
        delegate!.timelineTopViewModel(self, didClickAvatarOfUser: user)
    }
    
}
