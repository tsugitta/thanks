//
//  Post.swift
//  thanks
//
//  Created by sdklt on 2015/12/19.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import SwiftyJSON

class Thank {

    var id: Int!
    var toWhom: String!
    var toWhat: String!
    var postedAt: String!
    var user: User!

    
    init(json: JSON) {
        self.id = json["id"].int
        self.toWhom = json["to_whom"].string
        self.toWhat = json["to_what"].string
        self.postedAt = json["posted_at"].string
        self.user = User(jsonWithOnlyUser: json["user"])
    }

}
