//
//  MainViewController.swift
//  LioniqDemoTest
//
//  Created by impressly on 16/9/27.
//  Copyright © 2016年 OTT. All rights reserved.
//

import UIKit
class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewControllers()
    }
    
    func setupChildViewControllers() {
        let shopVC = UIStoryboard(name: "Shop", bundle: nil).instantiateViewController(withIdentifier: "shop") as? ShopViewController
        let cartVC = UIStoryboard(name: "ShoppingCart", bundle: nil).instantiateViewController(withIdentifier: "cart") as? ShoppingCartViewController
        setViewControllers([shopVC!, cartVC!], animated: true)
        self.selectedIndex = 0
    }
}
