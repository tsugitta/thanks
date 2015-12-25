//
//  CurrentUser.swift
//  thanks
//
//  Created by sdklt on 2015/12/18.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import Alamofire
import SwiftyJSON

class CurrentUser {
    
    static let sharedInstance = CurrentUser()
    var user: User?

    func updatePropertiesFromJson() {
    }
    
    func fetch() {
        Alamofire.request(
            .GET,
            "\(Settings.ApiRootPath)/api/users/current_user",
            headers: ["AuthToken": Auth.sharedInstance.authToken!]
        ).responseJSON { response in
            guard response.result.error == nil else {
                // Add error handling in the future
                print("Can't connect to the server: \(response.result.error!)")
                return
            }
            
            let json = JSON(response.result.value!)
            let user = User(jsonWithTweets: json)
            self.user = user
        }
    }

    func update(inputs inputs: [String: AnyObject], completion: () -> Void) {
        let thanks_id = (inputs["thanksId"] as! String).dataUsingEncoding(NSUTF8StringEncoding)!
        let name = (inputs["displayedName"] as! String).dataUsingEncoding(NSUTF8StringEncoding)!
        let profile = (inputs["profile"] as! String).dataUsingEncoding(NSUTF8StringEncoding)!
        let avatar = UIImagePNGRepresentation(inputs["avatar"] as! UIImage)
        
        Alamofire.upload(
            .PATCH,
            "\(Settings.ApiRootPath)/api/users/\(CurrentUser.sharedInstance.user!.id!)",
            headers: ["AuthToken": Auth.sharedInstance.authToken!],
            multipartFormData: { multipartFormData in
                multipartFormData.appendBodyPart(data: thanks_id, name: "thanks_id")
                multipartFormData.appendBodyPart(data: name, name: "name")
                multipartFormData.appendBodyPart(data: profile, name: "profile")
                if let unwrappedAvatar = avatar {
                    multipartFormData.appendBodyPart(data: unwrappedAvatar, name: "avatar", fileName: "avatar.png", mimeType: "image/png")
                }
            }, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .Success(let upload, _, _):
                upload.responseJSON { response in
                    guard response.result.error == nil else {
                        // Add error handling in the future
                        print(response.result.error)
                        return
                    }
                    
                    let json = JSON(response.result.value!)
                    let user = User(jsonWithTweets: json)
                    self.user = user
                    completion()
                }
                case .Failure(let encodingError):
                    // Add error handling in the future
                    print(encodingError)
                }
            }
        )
    }
    
    func followUser(target_user: User, completion: () -> Void) {
        let params = [
            "relationship": [
                "follower_id": user!.id,
                "followee_id": target_user.id
            ]
        ]
        
        Alamofire.request(
            .POST,
            "\(Settings.ApiRootPath)/api/relationships",
            parameters: params,
            headers: ["AuthToken": Auth.sharedInstance.authToken!]
        ).responseJSON { response in
            guard response.result.error == nil else {
                // Add error handling in the future
                print("Can't connect to the server: \(response.result.error!)")
                return
            }
            
            let json = JSON(response.result.value!)
            
            guard json["is_following"] != nil else {
                // Add error handling in the future
                print("Can't get correct response: \(response.result.error!)")
                return
            }
            
            if json["is_following"].bool! {
                target_user.isFollowing = true
            } else {
                target_user.isFollowing = false
            }
            
            ThankManager.sharedInstance.fetchThanks(completion: completion)
        }
    }
    
    func unfollowUser(target_user: User, completion: () -> Void) {
        let params = [
            "relationship": [
                "follower_id": user!.id,
                "followee_id": target_user.id
            ]
        ]

        Alamofire.request(
            .DELETE,
            "\(Settings.ApiRootPath)/api/relationships",
            parameters: params,
            headers: ["AuthToken": Auth.sharedInstance.authToken!]
        ).responseJSON { response in
            guard response.result.error == nil else {
                // Add error handling in the future
                print("Can't connect to the server: \(response.result.error!)")
                return
            }
            
            let json = JSON(response.result.value!)
            
            guard json["is_following"] != nil else {
                // Add error handling in the future
                print("Can't get correct response: \(response.result.error!)")
                return
            }
            
            if json["is_following"].bool! {
                target_user.isFollowing = true
            } else {
                target_user.isFollowing = false
            }
            
            ThankManager.sharedInstance.fetchThanks(completion: completion)
        }
    }
    
}
