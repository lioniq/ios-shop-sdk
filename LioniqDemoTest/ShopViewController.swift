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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  web = LioniqWebViewController()
        web.delegate = self
        self.navigationController?.pushViewController(web, animated: true)
        web.loadURLString("http://www.jianshu.com")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ShopViewController: LioniqWebViewControllerDelegate {
    func webView(webView: LioniqWebViewController, didStartLoadingURL URL: NSURL) {
        print("1")
    }
    func webview(webView: LioniqWebViewController, didLoadingURL URL: NSURL) {
        print("2")
    }
    func webView(webView: LioniqWebViewController, didFinishLoadingURL URL: NSURL) {
        print("3")
    }
    func webView(webView: LioniqWebViewController, didFailToLoadURL URL: NSURL, error: NSError) {
        print(error.description)
    }
}