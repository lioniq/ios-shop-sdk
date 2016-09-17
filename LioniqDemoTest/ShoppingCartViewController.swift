//
//  SecondViewController.swift
//  lioniq-demo
//
//  Created by JERRY LIU on 21/8/2016.
//  Copyright © 2016 ONTHETALL. All rights reserved.
//

import UIKit
import LioniqFrameWork

class ShoppingCartViewController: UIViewController {
    var wv: LIQWebview?
    var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupWebView()
        self.checkForLogin()
    }
    
    private func setupWebView() {
        self.wv = LIQWebview(frame: UIScreen.mainScreen().bounds)
        wv!.reloadForApp("d7d831e5163fabfe70755b9a33c4e349", appSecret: "53860b4e38b11647c00e0b22d03f6aa3")
        self.view.addSubview(wv!)
    }
    
    private func checkForLogin(){
        if self.userId != nil && self.wv != nil {
            self.wv?.removeFromSuperview()
            self.wv = LIQWebview(frame: UIScreen.mainScreen().bounds)
            wv?.reloadAppForUser("d7d831e5163fabfe70755b9a33c4e349", appSecret: "53860b4e38b11647c00e0b22d03f6aa3", userId: "")
            self.view.addSubview(wv!)
        }
    }
}

