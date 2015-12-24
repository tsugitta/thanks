//
//  TimeLineTableViewCell.swift
//  thanks
//
//  Created by sdklt on 2015/12/19.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class TimelineThanksTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var toWhomLabel: UILabel!
    @IBOutlet weak var toWhatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        toWhatLabel.numberOfLines = 0
    }

    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }
    
}
