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
    
    let key = "d80bf1f7e31b899f3a22e3c23c6f96eb"
    let secret = "c35e2b75dd8592875b40b7546310dcb0"
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
