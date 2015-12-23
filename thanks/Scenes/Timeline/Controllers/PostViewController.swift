//
//  PostViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/19.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol PostViewControllerDelegate: class {
    func postViewControllerDidPostThank(postViewController: PostViewController)
}

class PostViewController: UIViewController {

    private let mModel = PostViewModel()
    private var mView: PostView!
    
    weak var delegate: PostViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView = view as! PostView
        mView.submitButton.addTarget(self, action: "clickSubmitButton:", forControlEvents: .TouchUpInside)
        
        layoutNavigationBar()
    }

    func layoutNavigationBar() {
        let deleteImage = UIImage(named: "Delete-25")!
        let leftButton = UIBarButtonItem(image: deleteImage, style: .Plain, target: self, action: "clickCloseButton:")
        leftButton.tintColor = UIColor.darkGrayColor()
        self.navigationItem.leftBarButtonItem = leftButton
    }

    func clickSubmitButton(sender: UIButton) {
        guard inputsAreValid() else {
            // inputs are invalid.
            print("inputs are invalid")
            return
        }
        
        let params = [
            "to_whom": mView.toWhomTextField.text!,
            "to_what": mView.toWhatTextField.text!
        ]

        let thankManager = ThankManager.sharedInstance
        thankManager.postThank(params, completion: {
            self.delegate.postViewControllerDidPostThank(self)
        })

        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func clickCloseButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func inputsAreValid() -> Bool {
        return
            mView.toWhomTextField.text.isNotBlank &&
            mView.toWhatTextField.text.isNotBlank
    }
    
    
}

