//
//  User.swift
//  thanks
//
//  Created by sdklt on 2015/12/18.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import Alamofire
import SwiftyJSON

class User {

    var id: Int!
    var thanksId: String!
    var name: String!
    var profile: String!
    var avatarUrl: String?
    var isFollowing: Bool?
    var thanks = [Thank]()
    
    init(jsonWithOnlyUser json: JSON) {
        self.id = json["id"].int
        self.thanksId = json["thanks_id"].string
        self.name = json["name"].string
        self.profile = json["profile"].string
        self.avatarUrl = json["avatar_url"].string
        self.isFollowing = json["is_following"].bool
    }

    init(jsonWithTweets json: JSON) {
        self.id = json["user"]["id"].int
        self.thanksId = json["user"]["thanks_id"].string
        self.name = json["user"]["name"].string
        self.profile = json["user"]["profile"].string
        self.avatarUrl = json["user"]["avatar_url"].string
        
        var newThanks = [Thank]()
        for (_, thankJson) in json["thanks"] {
            let thank = Thank(json: thankJson)
            newThanks.append(thank)
        }
        
        self.thanks = newThanks
    }
    
}
