//
//  PostManager.swift
//  thanks
//
//  Created by sdklt on 2015/12/19.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ThankManager {

    static let sharedInstance = ThankManager()
    
    var timelineThanks = [Thank]()
    
    func createThanksFromJson(json: JSON) -> [Thank] {
        var thanks = [Thank]()
        
        for (_, thankJson) in json {
            let thank = Thank(json: thankJson)
            thanks.append(thank)
        }
        
        return thanks
    }
    
    func updateThanksFromJson(thanksJson: JSON, completion: () -> Void) {
        timelineThanks = createThanksFromJson(thanksJson)
        completion()
    }
    
    func fetchThanks(completion completion: () -> Void) {
        Alamofire.request(
            .GET,
            "\(Settings.ApiRootPath)/api/thanks/",
            headers: ["AuthToken": Auth.sharedInstance.authToken!]
        ).responseJSON { response in
            guard response.result.error == nil else {
                // Add error handling in the future
                print("Can't connect to the server: \(response.result.error!)")
                return
            }

            let json = JSON(response.result.value!)
            self.updateThanksFromJson(json["thanks"], completion: completion)
        }
    }
    
    func postThank(params: [String: String], completion: () -> Void) {
        Alamofire.request(
            .POST,
            "\(Settings.ApiRootPath)/api/thanks/",
            parameters: params,
            headers: ["AuthToken": Auth.sharedInstance.authToken!]
        ).responseJSON { response in
            guard response.result.error == nil else {
                // Add error handling in the future
                print("Can't connect to the server: \(response.result.error!)")
                return
            }

            let json = JSON(response.result.value!)
            self.updateThanksFromJson(json["thanks"], completion: completion)
            CurrentUser.sharedInstance.user!.thanks = self.createThanksFromJson(json["user_thanks"])
        }
    }
    
}
