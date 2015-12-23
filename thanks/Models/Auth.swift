//
//  Auth.swift
//  thanks
//
//  Created by sdklt on 2015/12/18.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import Alamofire
import SwiftyJSON

class Auth {
    
    static let sharedInstance = Auth()
    
    let currentUser = CurrentUser.sharedInstance
    
    var authToken: String?
    var thanksId: String?
    var name: String?
    var password: String?
    
    func updateProperties(dictionary: [String:String]) {
        self.thanksId = dictionary["thanksId"]!
        self.name = dictionary["name"]!
        self.password = dictionary["password"]!
    }
    
    func signUp() {
        let params = [
            "user": [
                "thanks_id": self.thanksId!,
                "name": self.name!,
                "password": self.password!,
                "password_confirmation": self.password!,
            ]
        ]
        
        Alamofire.request(.POST, "\(Settings.ApiRootPath)/api/users/", parameters: params)
            .responseJSON { response in
                guard response.result.error == nil else {
                    // Can't connect to the server.
                    print("Can't connect to the server: \(response.result.error!)")
                    return
                }
                
                let json = JSON(response.result.value!)
                
                guard json["errors"].isEmpty else {
                    // Invalid input.
                    print("Invalid input: \(json["errors"])")
                    return
                }
                print(json)
                let user = User(jsonWithOnlyUser: json["user"])
                self.currentUser.user = user
                self.saveAuthToken(json["auth_token"].string!)
        }
    }
    
    func saveAuthToken(token: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(token, forKey: "AuthToken")
        defaults.synchronize()
    }
    
    func getTokenFromDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        authToken = defaults.objectForKey("AuthToken") as? String
    }
    
    func alreadyHasToken() -> Bool {
        getTokenFromDefaults()
        return authToken != nil
    }
    
    func signIn() {

    }
    
    func signInWithAuthToken() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let token = defaults.objectForKey("AuthToken") as! String
        Alamofire.request(
            .POST,
            "\(Settings.ApiRootPath)/api/user_sessions/create_with_token",
            parameters: nil,
            headers: ["AuthToken": token]
        ).responseJSON { response in
            guard response.result.error == nil else {
                // Can't connect to the server.
                print("Can't connect to the server: \(response.result.error!)")
                return
            }
            
            let json = JSON(response.result.value!)
            let user = User(jsonWithTweets: json)
            self.currentUser.user = user
        }
    }

}
