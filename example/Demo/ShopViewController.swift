//
//  FirstViewController.swift
//  lioniq-demo
//
//  Created by JERRY LIU on 21/8/2016.
//  Copyright © 2016 ONTHETALL. All rights reserved.
//

import UIKit
import Lioniq

class ShopViewController: UIViewController {
    var liqview: LIQView?
    @IBOutlet weak var webviewPlaceholder: UIView!
    
    let key = "15ef0668e2f7d3234c1706997156c8a2"
    let secret = "2ab6633650437c8bb29ee5bcdf072034"
    let userId = "xyz123123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        
        let liqManager = LIQManager.defaultManager
        liqManager.setAppKey(key, appSecret: secret)
        liqManager.setAppUserId(userId)
        
        // load shop data
        if let shopDataUrl = NSBundle.mainBundle().pathForResource("shop_data", ofType: "json") {
            let shopDataUrl = NSURL(fileURLWithPath: shopDataUrl)
            liqManager.setShopData(shopDataUrl)
        }
        
        // check for updates
        liqManager.getUpdates()
        
        // load webview
        loadWebView()
    }
    
    private func loadWebView() {
        webviewPlaceholder.frame = self.view.frame
        self.liqview = LIQView(frame: webviewPlaceholder.frame)
        self.view.addSubview(self.liqview!)
        
        self.liqview!.delegate = self
        self.liqview!.reloadShop()
    }
}

extension ShopViewController: LIQViewDelegate {
    func webviewDidMain() {
        print("[ShopViewController webviewDidRouteToMain]")
        self.navigationController?.navigationBar.hidden = false
        self.tabBarController?.tabBar.hidden = false
    }
    func webviewDidItemDetail() {
        print("[ShopViewController webviewDidRouteToItemDetail]")
        self.navigationController?.navigationBar.hidden = true
        self.tabBarController?.tabBar.hidden = true
    }
    func webviewDidAddToCart(dict: Dictionary<String, AnyObject>) {
        print("[ShopViewController webviewDidAddToCart] 成功加入购物车")
    }
}
