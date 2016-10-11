//
//  SecondViewController.swift
//  lioniq-demo
//
//  Created by JERRY LIU on 21/8/2016.
//  Copyright © 2016 ONTHETALL. All rights reserved.
//

import UIKit
import Lioniq

class ShoppingCartViewController: UIViewController {
    var wv: LIQWebview?
    @IBOutlet weak var webviewPlaceholder: UIView!
    
    let key = "d80bf1f7e31b899f3a22e3c23c6f96eb"
    let secret = "c35e2b75dd8592875b40b7546310dcb0"
    let userId = "xyz123123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wv = LIQWebview(frame: webviewPlaceholder.frame)
        self.wv?.reloadCart(key: key, secret: secret, userId: userId)
        self.view.addSubview(wv!)
    }
}

extension ShoppingCartViewController: LIQWebviewDelegate {
    func webviewDidMain() {
        print("[CartViewController webviewDidRouteToMain]")
        self.tabBarController?.tabBar.isHidden = false
    }
    func webviewDidCheckout() {
        print("[CartViewController didCheckout]")
        self.tabBarController?.tabBar.isHidden = true
    }
    func webviewDidOrder(orderData: Dictionary<String, AnyObject>) {
        print("[CartViewController didOrder]")
        self.tabBarController?.tabBar.isHidden = true
    }
    func webviewDidItemDetail() {
        print("[CartViewController webviewDidRouteToItemDetail")
        self.tabBarController?.tabBar.isHidden = true
    }
}

