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
    
    let key = "15ef0668e2f7d3234c1706997156c8a2"
    let secret = "2ab6633650437c8bb29ee5bcdf072034"
    let userId = "xyz123123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadWebview()
    }
    private func loadWebview() {
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

