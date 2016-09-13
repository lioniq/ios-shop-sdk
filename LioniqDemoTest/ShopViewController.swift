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

    @IBOutlet weak var webview: UIWebView!
    
    var wv: LIQWebview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wv = LIQWebview(frame: webview.frame)
        wv!.reloadForApp("2c5c4850917f7a56fb2df41e505bab53", appSecret: "e1c5bd65891498d0cd1e1e3f3a9250fa")
        self.webview.hidden = true
        self.view.addSubview(wv!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
