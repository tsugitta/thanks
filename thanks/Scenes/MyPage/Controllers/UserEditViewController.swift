//
//  UserEditViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/23.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

protocol UserEditViewControllerDelegate: class {
    func userEditViewControllerDidClickUploadButton(userEditViewController: UserEditViewController)
    func userEditViewControllerDidUpload(userEditViewController: UserEditViewController)
}

class UserEditViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    private let mModel = UserEditViewModel()
    private var mView: UserEditView!
    private var imagePickerVC: UIImagePickerController!
    
    weak var delegate: UserEditViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView = view as! UserEditView
        
        addEventListener()
        layoutNavigationBar()
        setImagePicker()
    }

    func addEventListener() {
        mView.userAvatarButton.addTarget(self, action: "clickUserAvatarButton:", forControlEvents: .TouchUpInside)
    }
    
    func layoutNavigationBar() {
        let deleteImage = UIImage(named: "Delete-100")?.resize(afterWidth: 22, afterHeight: 22)
        let checkImage = UIImage(named: "Checkmark-100")?.resize(afterWidth: 22, afterHeight: 22)

        let leftButton = UIBarButtonItem(image: deleteImage, style: .Plain, target: self, action: "clickCloseButton:")
        let rightButton = UIBarButtonItem(image: checkImage, style: .Plain, target: self, action: "clickPostButton:")
        
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func setImagePicker() {
        imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self
    }
    
    func clickCloseButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func clickPostButton(sender: UIBarButtonItem) {
        let inputs: [String: AnyObject] = [
            "thanksId": mView.thanksIdTextField.text!,
            "displayedName": mView.displayedNameTextField.text!,
            "profile": mView.profileTextField.text!,
            "avatar": mView.userAvatarButton.backgroundImageForState(.Normal)!
        ]
        
        CurrentUser.sharedInstance.update(inputs: inputs, completion: {
            self.delegate!.userEditViewControllerDidUpload(self)
        })

        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func clickUserAvatarButton(sender: AvatarButton) {
        showImagePickActionSheet()
    }
    
    func showImagePickActionSheet() {
        let actionSheet:UIAlertController = UIAlertController(
            title:"Change Avatar Photo",
            message: nil,
            preferredStyle: UIAlertControllerStyle.ActionSheet
        )

        let cancelAction:UIAlertAction = UIAlertAction(
            title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil
        )
        
        let choosePhotoAction:UIAlertAction = UIAlertAction(
            title: "Choose from library",
            style: UIAlertActionStyle.Default,
            handler: { action in
                self.imagePickerVC.sourceType = .PhotoLibrary
                self.imagePickerVC.allowsEditing = true
                self.presentViewController(self.imagePickerVC, animated: true, completion: nil)
            }
        )

        let takePhotoAction:UIAlertAction = UIAlertAction(
            title: "Take photo",
            style: UIAlertActionStyle.Default,
            handler: { action in
                self.imagePickerVC.sourceType = .Camera
                self.imagePickerVC.allowsEditing = true
                self.presentViewController(self.imagePickerVC, animated: true, completion: nil)
            }
        )
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(choosePhotoAction)
        actionSheet.addAction(takePhotoAction)
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as! UIImage? {
            mView.userAvatarButton.setBackgroundImage(pickedImage, forState: .Normal)
            mView.userAvatarButton.setTitle("", forState: .Normal)
        }
        
        imagePickerVC.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
