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
        self.navigationController?.navigationBar.isHidden = true
        webviewPlaceholder.frame = self.view.frame
        self.liqview = LIQView(frame: webviewPlaceholder.frame)
        self.liqview?.reloadShop(key, secret: secret, userId: userId)
        self.view.addSubview(liqview!)
        self.liqview?.delegate = self
    }
}

extension ShopViewController: LIQViewDelegate {
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
    func webviewDidAddToCart(_ dict: Dictionary<String, AnyObject>) {
        print("[ShopViewController webviewDidAddToCart] 成功加入购物车")
    }
}
