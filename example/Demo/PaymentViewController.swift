//
//  PaymentViewController.swift
//  Demo
//
//  Created by impressly on 2016/10/18.
//  Copyright © 2016年 OTT. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    var orderData: Dictionary<String, AnyObject>?
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var orderNoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
        // 订单总金额
        let amount = self.orderData?["total_amount"] as! Int / 100
        self.totalAmountLabel.text = "￥\(amount)"
        // 订单号
        self.orderNoLabel.text = self.orderData?["order_no"] as? String
        
    }
    @IBAction func popAction(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func alipayAction(sender: UIButton) {
        let alertController = UIAlertController(title: "", message: "请接入支付SDK", preferredStyle: UIAlertControllerStyle.Alert)
        let affirmAction = UIAlertAction(title: "好的", style: .Default, handler: nil)
        alertController.addAction(affirmAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}
