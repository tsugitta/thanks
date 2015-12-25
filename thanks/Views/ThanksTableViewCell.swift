//
//  ThanksTableViewCell.swift
//  thanks
//
//  Created by sdklt on 2015/12/25.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class ThanksTableViewCell: UITableViewCell {

    @IBOutlet weak var userAvatarImageView: CircleImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var toWhomLabel: UILabel!
    @IBOutlet weak var toWhatLabel: UILabel!
    @IBOutlet weak var postedAtLabel: UILabel!
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fromLabel.font = fromLabel.font.fontWithSize(12)
        userNameLabel.font = userNameLabel.font.fontWithSize(12)
        toLabel.font = toLabel.font.fontWithSize(12)
        toWhomLabel.font = toWhomLabel.font.fontWithSize(12)
        
        postedAtLabel.font = postedAtLabel.font.fontWithSize(10)
    }

    func updateLabelsWithThank(thank: Thank) {
        userNameLabel.text = thank.user.name
        toWhomLabel.text = thank.toWhom
        toWhatLabel.text = thank.toWhat
        postedAtLabel.text = thank.postedAt
        
        if let avatarUrl = thank.user.avatarUrl {
            userAvatarImageView.getCarrierWaveImageWithUrl(avatarUrl)
        } else {
            userAvatarImageView.image = UIImage(named: "NoImage")
        }
    }
    
}
