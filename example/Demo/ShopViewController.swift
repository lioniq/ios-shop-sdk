//
//  FirstViewController.swift
//  Example
//
//  Created by JERRY LIU on 25/9/2016.
//  Copyright © 2016 OTT. All rights reserved.
//

import UIKit
import Lioniq

class ShopViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var webviewPlaceholder: UIView!
    
    var liqView: LIQView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // lioniq shop app settings
        let key = "15ef0668e2f7d3234c1706997156c8a2"
        let secret = "2ab6633650437c8bb29ee5bcdf072034"
        let userId = "xyz123123"
        
        let lm = LIQManager.defaultManager
        lm.setAppKey(key, appSecret: secret)
        lm.setAppUserId(userId)
        
        // load shop data
        if let shopDataUrl = NSBundle.mainBundle().pathForResource("shop_data", ofType: "json") {
            let shopDataUrl = NSURL(fileURLWithPath: shopDataUrl)
            lm.setShopData(shopDataUrl)
        }
        
        // check for updates
        lm.getUpdates()

        // load webview
        loadWebView()
        createSubViews()
    }
    
    private func loadWebView() {
        webviewPlaceholder.frame = self.view.frame
        self.liqView = LIQView(frame: webviewPlaceholder.frame)
        self.view.addSubview(self.liqView)
        
        self.liqView.delegate = self
        self.liqView.reloadShop()
    }
    
    private func createSubViews() {
        //SearchBar
        let searchBarTextField = self.searchBar.valueForKey("searchField") as! UITextField
        searchBarTextField.textAlignment = NSTextAlignment.Center
        searchBarTextField.textColor = UIColor.whiteColor()
        //调整视图层次
        self.view.bringSubviewToFront(headerView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = true
        self.tabBarController?.tabBar.hidden = false
    }
}

extension ShopViewController: LIQViewDelegate {
    func webviewDidMain() {
        print("[ShopViewController webviewDidRouteToMain]")
//        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.hidden = false
        self.headerView.hidden = false
    }
    func webviewDidItemDetail() {
        print("[ShopViewController webviewDidRouteToItemDetail]")
//        self.navigationController?.navigationBar.isHidden = true
        self.headerView.hidden = true
        self.tabBarController?.tabBar.hidden = true
    }
    
    func webviewDidAddToCart(cartItemData: Dictionary<String, AnyObject>) {
        print(cartItemData)
    }
}

extension ShopViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        
        performSegueWithIdentifier("searchVC", sender: nil)
        return false
    }
}





