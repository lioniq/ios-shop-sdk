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
        lm.setAppKey(appKey: key, appSecret: secret)
        lm.setAppUserId(appUserId: userId)
        
        // load shop data
        if let shopDataUrl = Bundle.main.url(forResource: "shop_data", withExtension: "json") {
            lm.setShopData(shopDataURL: shopDataUrl)
        }
        
        // check for updates
        // lm.getUpdates()

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
        let searchBarTextField = self.searchBar.value(forKey: "searchField") as! UITextField
        searchBarTextField.textAlignment = NSTextAlignment.center
        searchBarTextField.textColor = UIColor.white
        //调整视图层次
        self.view.bringSubview(toFront: headerView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
}

extension ShopViewController: LIQViewDelegate {
    func webviewDidMain() {
        print("[ShopViewController webviewDidRouteToMain]")
//        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
        self.headerView.isHidden = false
    }
    func webviewDidItemDetail() {
        print("[ShopViewController webviewDidRouteToItemDetail]")
//        self.navigationController?.navigationBar.isHidden = true
        self.headerView.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    func webviewDidAddToCart(_ dict: Dictionary<String, AnyObject>) {
        //
    }
}

extension ShopViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // Webview Search
        self.performSegue(withIdentifier: "search", sender: nil)
        
        return false
    }
}





