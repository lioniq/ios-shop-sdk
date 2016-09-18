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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wv = LIQWebview(frame: UIScreen.mainScreen().bounds)
        self.wv?.reloadCart("d7d831e5163fabfe70755b9a33c4e349", secret: "53860b4e38b11647c00e0b22d03f6aa3", userId: "2d62c931289901240e819f03ecef58a1")
        self.view.addSubview(wv!)
    }
}

