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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mView = view as! SearchView
        mView.tableView.dataSource = mModel
        mView.tableView.delegate = self
        mModel.delegate = self

        layoutNavigationBar()
    }

    override func viewWillAppear(animated: Bool) {
        UserManager.sharedInstance.searchedUsers = []
    }
    
    func layoutNavigationBar() {
        let searchBar = UISearchBar()
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

    func searchViewModelDidUpdateFollowingStatus(searchViewModel: SearchViewModel) {
        mView.tableView.reloadData()
    }
    
    func goBack(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}
