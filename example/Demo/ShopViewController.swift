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
    var wv: LIQWebview?
    @IBOutlet weak var webviewPlaceholder: UIView!
    
    let key = "15ef0668e2f7d3234c1706997156c8a2"
    let secret = "2ab6633650437c8bb29ee5bcdf072034"
    let userId = "xyz123123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wv = LIQWebview(frame: webviewPlaceholder.frame)
        self.wv?.reloadShop(key: key, secret: secret, userId: userId)
        self.view.addSubview(wv!)
        self.wv?.delegate = self
    }
}

extension ShopViewController: LIQWebviewDelegate {
    func webviewDidMain() {
        print("[ShopViewController webviewDidRouteToMain]")
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    func webviewDidItemDetail() {
        print("[ShopViewController webviewDidRouteToItemDetail]")
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    func webviewDidAddToCart(dict: Dictionary<String, AnyObject>) {
        //
    }
}
