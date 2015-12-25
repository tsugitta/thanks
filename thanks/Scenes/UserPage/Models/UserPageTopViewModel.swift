//
//  UserPageViewModel.swift
//  thanks
//
//  Created by sdklt on 2015/12/25.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

protocol UserPageTopViewModelDelegate: class {
    
    func userPageTopViewModelDidUpdateFollowingStatus(userPageTopViewModel: UserPageTopViewModel)
    
}

class UserPageTopViewModel: NSObject, UITableViewDataSource {
    
    weak var delegate: UserPageTopViewModelDelegate!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let user = UserManager.sharedInstance.showingUser
        switch section {
        case 0:
            return 1
            
        case 1:
            return user.thanks.count
            
        default:
            return 0
            
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let user = UserManager.sharedInstance.showingUser
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("UserPageHeaderTableViewCell") as! UserPageHeaderTableViewCell
            cell.updateLabelsWithUser(user)
            cell.userFollowButton.addTarget(self, action: "didClickUserFollowButton:", forControlEvents: .TouchUpInside)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("ThanksTableViewCell", forIndexPath: indexPath) as! ThanksTableViewCell
            cell.selectionStyle = .None
            let thank = user.thanks[indexPath.row]
            thank.user = user
            cell.updateLabelsWithThank(thank)
            return cell
            
        default:
            return UITableViewCell()
            
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 350
            
        case 1:
            return UITableViewAutomaticDimension
            
        default:
            return 0
            
        }
    }
    
    func didClickUserFollowButton(sender: UIButton) {
        let user = UserManager.sharedInstance.showingUser
        if user.isFollowing! {
            CurrentUser.sharedInstance.unfollowUser(user, completion: {
                self.delegate!.userPageTopViewModelDidUpdateFollowingStatus(self)
            })
        } else {
            CurrentUser.sharedInstance.followUser(user, completion: {
                self.delegate!.userPageTopViewModelDidUpdateFollowingStatus(self)
            })
        }
    }
    
}
