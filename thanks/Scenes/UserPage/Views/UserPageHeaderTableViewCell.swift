//
//  MyPageHeaderTableViewCell.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class UserPageHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileLabel: UILabel!
    @IBOutlet weak var userFollowButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutImageView()
        selectionStyle = .None
    }

    func layoutImageView() {
        userAvatarImageView.layer.cornerRadius = userAvatarImageView.frame.width / 2
        userAvatarImageView.clipsToBounds = true
    }
    
    func updateLabelsWithUser(user: User) {
        userNameLabel.text = user.name
        userProfileLabel.text = user.profile
        
        if let avatarUrl = user.avatarUrl {
            userAvatarImageView.getCarrierWaveImageWithUrl(avatarUrl)
        } else {
            userAvatarImageView.image = UIImage(named: "NoImage")
        }
        
        if user.id == CurrentUser.sharedInstance.user!.id {
            userFollowButton.layer.hidden = true
        } else if user.isFollowing! {
            userFollowButton.setTitle("Unfollow", forState: .Normal)
        } else {
            userFollowButton.setTitle("Follow", forState: .Normal)
        }
    }
    
}
