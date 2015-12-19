//
//  User.swift
//  thanks
//
//  Created by sdklt on 2015/12/18.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import SwiftyJSON

class User {

    var id: Int?
    var thanksId: String?
    var name: String?
    var imageUrl: String?
    
    init(json: JSON) {
        self.id = json["id"].int
        self.thanksId = json["thanksId"].string
        self.name = json["name"].string
        self.imageUrl = json["imageUrl"].string
    }

}
