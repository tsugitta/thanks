//
//  MyPageHeaderTableViewCell.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class MyPageHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileLabel: UILabel!
    @IBOutlet weak var userEditButton: UIButton!
    
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
        userEditButton.addTarget(self, action: "didClickUserEditButton", forControlEvents: .TouchUpInside)

        if let avatarUrl = user.avatarUrl {
            userAvatarImageView.getCarrierWaveImageWithUrl(avatarUrl)
        } else {
            userAvatarImageView.image = UIImage(named: "NoImage")
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
