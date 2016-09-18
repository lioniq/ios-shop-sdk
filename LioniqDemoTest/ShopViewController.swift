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
        LoadManager.defaultManager.appKey = "d7d831e5163fabfe70755b9a33c4e349"
        LoadManager.defaultManager.appSecret = "53860b4e38b11647c00e0b22d03f6aa3"
        self.wv = LIQWebview(frame: UIScreen.mainScreen().bounds)
        wv!.reloadForApp(LoadManager.defaultManager.appKey!, appSecret: LoadManager.defaultManager.appSecret!)
        self.view.addSubview(wv!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
