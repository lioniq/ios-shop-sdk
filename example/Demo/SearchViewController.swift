//
//  SearchViewController.swift
//  Lioniq
//
//  Created by impressly on 2016/11/7.
//  Copyright © 2016年 OTT. All rights reserved.
//

import UIKit
import Lioniq

class SearchViewController: UIViewController {
    @IBOutlet weak var webviewPlaceholder: UIView!
    var liqView: LIQView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.navigationBar.hidden = true
        loadWebView()
    }
    
    private func loadWebView() {
        webviewPlaceholder.frame = self.view.frame
        self.liqView = LIQView(frame: webviewPlaceholder.frame)
        self.view.addSubview(self.liqView)
        
        self.liqView.delegate = self
        self.liqView.reloadSearch()
    }
}

extension SearchViewController: LIQViewDelegate {
    func webviewSearchDidCancel() {
        print("didCancel")
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func webviewDidAddToCart(cartItemData: Dictionary<String, AnyObject>) {
        print("didAddToCart: \(cartItemData)")
    }
}
