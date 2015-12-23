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
    
    var thanks = [Thank]()
    
    func updateThanksFromJson(thanksJson: JSON, completion: () -> Void) {
        var newThanks = [Thank]()
        for (_, thankJson) in thanksJson {
            let thank = Thank(json: thankJson)
            newThanks.append(thank)
        }
        thanks = newThanks
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
            self.updateThanksFromJson(json, completion: completion)
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
            self.updateThanksFromJson(json, completion: completion)
        }
    }
    
}
