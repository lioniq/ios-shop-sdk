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
        self.navigationController?.navigationBar.isHidden = false
        // 订单总金额
        let amount = self.orderData?["total_amount"] as! Double / 100
        self.totalAmountLabel.text = "¥\(amount)"
        // 订单号
        self.orderNoLabel.text = self.orderData?["order_no"] as? String
        
    }
    @IBAction func popAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func alipayAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "", message: "请接入支付SDK", preferredStyle: UIAlertControllerStyle.alert)
        let affirmAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default)
        alertController.addAction(affirmAction)
        present(alertController, animated: true)
    }
}
