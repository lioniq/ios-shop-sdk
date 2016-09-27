//
//  FirstViewController.swift
//  lioniq-demo
//
//  Created by JERRY LIU on 21/8/2016.
//  Copyright © 2016 ONTHETALL. All rights reserved.
//

import UIKit
import LioniqFrameWork

class ShopViewController: UIViewController {
    var wv: LIQWebview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wv = LIQWebview(frame: UIScreen.mainScreen().bounds)
        self.wv?.reloadShop("f9da1ab153acaf9563f46022218866a2", secret: "673feaf2e3c6986363001787dd7d3ff1", userId: "xyz123123")
        self.view.addSubview(wv!)
        self.wv?.delegate = self
    }
}

extension ShopViewController: LIQWebviewDelegate {
    func webviewDidRouteToMain() {
        print("[FirstViewController webviewDidRouteToShop]")
        self.navigationController?.navigationBarHidden = false
    }
    func webviewDidRouteToItemDetail() {
        print("[FirstViewController webviewDidRouteToItemDetail]")
        self.navigationController?.navigationBarHidden = true
    }
}
