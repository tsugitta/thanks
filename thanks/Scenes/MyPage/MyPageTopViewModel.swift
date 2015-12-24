//
//  MyPageTopViewModel.swift
//  thanks
//
//  Created by sdklt on 2015/12/22.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import Alamofire

protocol MyPageTopViewModelDelegate: class {
    func myPageTopViewModelDidTapUserEditButton(myPageTopViewModel: MyPageTopViewModel)
}

class MyPageTopViewModel: NSObject, UITableViewDataSource {
    
    weak var delegate: MyPageTopViewModelDelegate!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let user = CurrentUser.sharedInstance.user else {
            return 0
        }
        
        switch section {
        case 0:
            return 1
            
        case 1:
            return user.thanks!.count
            
        default:
            return 0
            
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let user = CurrentUser.sharedInstance.user!

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("MyPageHeaderTableViewCell") as! MyPageHeaderTableViewCell
            
            if let avatarUrl = user.avatarUrl {
                Alamofire.request(
                    .GET,
                    "\(Settings.ApiRootPath)\(avatarUrl)", // CarrierWave's avatar_url includes initial slash
                    headers: ["AuthToken": Auth.sharedInstance.authToken!]
                ).response { _, _, data, error in
                    if error == nil {
                        user.avatar = UIImage(data: data!)
                    } else {
                        user.avatar = UIImage(named: "NoImage")
                    }
                    
                    cell.userAvatarImageView.image = user.avatar
                }
            }

            cell.userNameLabel.text = user.name
            cell.userProfileLabel.text = user.profile
            cell.userEditButton.addTarget(self, action: "didClickUserEditButton", forControlEvents: .TouchUpInside)
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("MyPageThanksTableViewCell", forIndexPath: indexPath) as! MyPageThanksTableViewCell
            
            let thank = user.thanks![indexPath.row]
            
            if let avatarUrl = user.avatarUrl {
                Alamofire.request(
                    .GET,
                    "\(Settings.ApiRootPath)\(avatarUrl)", // CarrierWave's avatar_url includes initial slash
                    headers: ["AuthToken": Auth.sharedInstance.authToken!]
                ).response { _, _, data, error in
                    if error == nil {
                        user.avatar = UIImage(data: data!)
                    } else {
                        user.avatar = UIImage(named: "NoImage")
                    }
                    
                    cell.userImageView.image = user.avatar
                }
            }
            
            cell.userNameLabel.text = user.name
            cell.toWhatLabel.text = thank.toWhat
            cell.toWhomLabel.text = thank.toWhom
            
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
            return 80
            
        default:
            return 0
            
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
            
        case 1:
            return 90
            
        default:
            return 0
            
        }
    }
    
    
    func didClickUserEditButton() {
        delegate?.myPageTopViewModelDidTapUserEditButton(self)
    }
    
}
