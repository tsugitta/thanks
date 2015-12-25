//
//  TimelineTopViewModel.swift
//  thanks
//
//  Created by sdklt on 2015/12/17.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import Alamofire

class TimelineTopViewModel: NSObject, UITableViewDataSource {
    
    let thankManager = ThankManager.sharedInstance
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thankManager.timelineThanks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ThanksTableViewCell", forIndexPath: indexPath) as! ThanksTableViewCell
        let thank = thankManager.timelineThanks[indexPath.row]
        cell.updateLabelsWithThank(thank)
        
        return cell
    }
    
}
