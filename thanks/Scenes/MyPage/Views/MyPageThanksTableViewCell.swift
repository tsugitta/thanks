//
//  TimeLineTableViewCell.swift
//  thanks
//
//  Created by sdklt on 2015/12/19.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class MyPageThanksTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var toWhomLabel: UILabel!
    @IBOutlet weak var toWhatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutUserImageView()
        layoutUserNameLabel()
        toWhatLabel.numberOfLines = 0
    }

    func layoutUserImageView() {
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        userImageView.clipsToBounds = true
    }
    
    func layoutUserNameLabel() {
        var rect = userNameLabel.frame
        userNameLabel.sizeToFit()
        rect.size.height = CGRectGetHeight(userNameLabel.frame)
        userNameLabel.frame = rect
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
