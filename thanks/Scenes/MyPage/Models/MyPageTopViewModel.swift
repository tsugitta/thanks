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
            return user.thanks.count
            
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
                cell.userAvatarImageView.getCarrierWaveImageWithUrl(avatarUrl)
            } else {
                cell.userAvatarImageView.image = UIImage(named: "NoImage")
            }
            
            cell.userNameLabel.text = user.name
            cell.userProfileLabel.text = user.profile
            cell.userEditButton.addTarget(self, action: "didClickUserEditButton", forControlEvents: .TouchUpInside)
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("ThanksTableViewCell", forIndexPath: indexPath) as! ThanksTableViewCell
            
            let thank = user.thanks[indexPath.row]
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
        
    func didClickUserEditButton() {
        delegate?.myPageTopViewModelDidTapUserEditButton(self)
    }
    
}
