//
//  SearchViewController.swift
//  Lioniq
//
//  Created by JERRY LIU on 7/11/2016.
//  Copyright © 2016 OTT. All rights reserved.
//

import Foundation
import UIKit
import Lioniq

class SearchViewController : UIViewController {
    
    @IBOutlet weak var webviewPlaceholder: UIView!
    var liqView: LIQView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    func webviewDidCancel() {
        print("[SearchViewController didCancel]")
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    func webviewDidItemDetail() {
        print("[ShopViewController webviewDidRouteToItemDetail]")
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
}
