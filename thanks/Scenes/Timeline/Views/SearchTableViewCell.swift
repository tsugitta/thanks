//
//  TimelineSearchTableViewCell.swift
//  thanks
//
//  Created by sdklt on 2015/12/24.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userThanksIdLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!

    func updateLabelsWithUser(user: User) {
        userNameLabel.text = user.name
        userThanksIdLabel.text = "@\(user.thanksId)"
        
        if let avatarUrl = user.avatarUrl {
            userAvatarImageView.getCarrierWaveImageWithUrl(avatarUrl)
        } else {
            userAvatarImageView.image = UIImage(named: "NoImage")
        }
        
        if user.isFollowing! {
            followButton.setTitle("Unfollow", forState: .Normal)
        } else {
            followButton.setTitle("Follow", forState: .Normal)
        }
    }
    
}
