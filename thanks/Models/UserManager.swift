//
//  UserManager.swift
//  thanks
//
//  Created by sdklt on 2015/12/24.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UserManager {
    
    static let sharedInstance = UserManager()
    
    var users = [User]()
    var searchedUsers = [User]()
    
    func searchUsersWithKeyword(keyword: String, completion: () -> Void) {
        Alamofire.request(
            .GET,
            "\(Settings.ApiRootPath)/api/users/search",
            parameters: ["keyword": keyword],
            headers: ["AuthToken": Auth.sharedInstance.authToken!]
        ).responseJSON { response in
            guard response.result.error == nil else {
                // Add error handling in the future
                print("Can't connect to the server: \(response.result.error!)")
                return
            }

            let json = JSON(response.result.value!)
            var newUsers = [User]()

            for (_, userJson) in json["users"] {
                let user = User(jsonWithOnlyUser: userJson)
                newUsers.append(user)
            }
            
            self.searchedUsers = newUsers
            completion()
        }
    }
    
}