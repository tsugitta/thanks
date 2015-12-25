//
//  SearchViewController.swift
//  thanks
//
//  Created by sdklt on 2015/12/24.
//  Copyright © 2015年 sdklt. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, SearchViewModelDelegate {

    private let mModel = SearchViewModel()
    private var mView: SearchView!

    private var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView = view as! SearchView
        mView.tableView.dataSource = mModel
        mView.tableView.delegate = self
        mModel.delegate = self

        UserManager.sharedInstance.searchedUsers = []
        
        layoutNavigationBar()
        let tapGesture = UITapGestureRecognizer(target: self, action: "didClickTableView:")
        mView.tableView.addGestureRecognizer(tapGesture)
    }

    func layoutNavigationBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        let backImage = UIImage(named: "Back-100")?.resize(afterWidth: 22, afterHeight: 22)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style: .Plain, target: self, action: "goBack:")
        // cannot change the image of navigationItem.backButtonItem, therefore   inevitably use leftBarButtonItem

    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        let keyword = searchBar.text
        mModel.searchUsersWithKeyword(keyword!, completion: {
            self.mView.tableView.reloadData()
        })
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return mModel.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        searchBar.resignFirstResponder()
        
        let user = UserManager.sharedInstance.searchedUsers[indexPath.row]
        UserManager.sharedInstance.showingUser = user
        
        let storyboard = UIStoryboard(name: "UserPage", bundle: nil)
        let navigationVC = storyboard.instantiateInitialViewController() as! NavigationController
        let userVC = navigationVC.viewControllers.first as! UserPageTopViewController

        navigationController?.pushViewController(userVC, animated: true)
    }
    
    func searchViewModelDidUpdateFollowingStatus(searchViewModel: SearchViewModel) {
        mView.tableView.reloadData()
    }
    
    func didClickTableView(sender: UIGestureRecognizer) {
        searchBar.resignFirstResponder()
    }
    
    func goBack(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}
