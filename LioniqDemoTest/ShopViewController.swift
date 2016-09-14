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
        
        self.wv = LIQWebview(frame: UIScreen.mainScreen().bounds)
        wv!.reloadForApp("d7d831e5163fabfe70755b9a33c4e349", appSecret: "53860b4e38b11647c00e0b22d03f6aa3")
        self.webview.hidden = true
        self.view.addSubview(wv!)
        
        
//        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html",inDirectory: "webviews")
//        let url = NSURL(fileURLWithPath: path!)
////        let url = NSURL(fileURLWithPath: "/Users/impressly/ios/lioniq-ios/LioniqDemoTest/webviews/index.html")
////        
//        let htmlString = try! NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding)
//        var keyInjected = htmlString.stringByReplacingOccurrencesOfString("TEMPLATE_APP_KEY", withString: "d7d831e5163fabfe70755b9a33c4e349")
//        keyInjected = keyInjected.stringByReplacingOccurrencesOfString("TEMPLATE_APP_SECRET", withString: "53860b4e38b11647c00e0b22d03f6aa3")
//        self.webview.loadHTMLString(keyInjected, baseURL: url)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
