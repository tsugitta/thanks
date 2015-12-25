//
//  SearchViewModel.swift
//  thanks
//
//  Created by sdklt on 2015/12/24.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

protocol SearchViewModelDelegate: class {

//    func searchViewModelDidClickUserFollowButton(searchViewModel: SearchViewModel)
    func searchViewModelDidUpdateFollowingStatus(searchViewModel: SearchViewModel)
    
}


class SearchViewModel: NSObject, UITableViewDataSource {

    let userManager = UserManager.sharedInstance

    weak var delegate: SearchViewModelDelegate!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userManager.searchedUsers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchTableViewCell", forIndexPath: indexPath) as! SearchTableViewCell
        let user = userManager.searchedUsers[indexPath.row]
        
        cell.userNameLabel.text = user.name
        cell.userThanksIdLabel.text = "@\(user.thanksId)"
        
        if let avatarUrl = user.avatarUrl {
            cell.userAvatarImageView.getCarrierWaveImageWithUrl(avatarUrl)
        } else {
            cell.userAvatarImageView.image = UIImage(named: "NoImage")
        }

        if user.isFollowing! {
            cell.followButton.setTitle("Unfollow", forState: .Normal)
        } else {
            cell.followButton.setTitle("Follow", forState: .Normal)
        }
        
        cell.followButton.tag = indexPath.row
        cell.followButton.addTarget(self, action: "didClickFollowButton:", forControlEvents: .TouchUpInside)
        
        
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85
    }
    
    func didClickFollowButton(sender: UIButton) {
        let user = userManager.searchedUsers[sender.tag]
        if user.isFollowing! {
            CurrentUser.sharedInstance.unfollowUser(user, completion: {
                self.delegate!.searchViewModelDidUpdateFollowingStatus(self)
            })
        } else {
            CurrentUser.sharedInstance.followUser(user, completion: {
                self.delegate!.searchViewModelDidUpdateFollowingStatus(self)
            })
        }
    }
    
    func searchUsersWithKeyword(keyword: String, completion: () -> Void) {
        if keyword.isEmpty {
            userManager.searchedUsers = []
            completion()
        } else {
            userManager.searchUsersWithKeyword(keyword, completion: completion)
        }
    }
}
