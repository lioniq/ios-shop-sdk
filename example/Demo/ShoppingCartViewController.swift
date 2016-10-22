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
    var liqview: LIQView?
    @IBOutlet weak var webviewPlaceholder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebview()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
        
        // reload for user
        let userId = "xyz123123"
        reload(userId)
    }
    private func loadWebview() {
        webviewPlaceholder.frame = self.view.frame
        self.liqview = LIQView(frame: webviewPlaceholder.frame)
        self.liqview?.delegate = self
        self.view.addSubview(liqview!)
        
        self.liqview?.reloadCart()
    }
    
    private func reload(userId: String) {
        LIQManager.defaultManager.setAppUserId(userId)
        self.liqview?.refreshShopUser()
    }
    
    // 跳转至支付界面, 把orderData 传过去, 接入支付SDK即可实现订单支付
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "payment" {
            let paymentVC = segue.destinationViewController as! PaymentViewController
            paymentVC.orderData = sender as! Dictionary<String, AnyObject>?
        }
    }
}

extension ShoppingCartViewController: LIQViewDelegate {
    func webviewDidMain() {
        print("[CartViewController webviewDidRouteToMain]")
        self.tabBarController?.tabBar.hidden = false
    }
    func webviewDidCheckout() {
        print("[CartViewController didCheckout]")
        self.tabBarController?.tabBar.hidden = true
    }
    
    func webviewDidOrder(orderData: Dictionary<String, AnyObject>) {
        print("[CartViewController didOrder]:\(orderData)")
        self.tabBarController?.tabBar.hidden = true
        
        // 跳转至支付
        self.performSegueWithIdentifier("payment", sender: orderData)
    }
    
    func webviewDidItemDetail() {
        print("[CartViewController webviewDidRouteToItemDetail")
        self.tabBarController?.tabBar.hidden = true
    }
}

