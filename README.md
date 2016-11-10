# LionIQ 数据狮 iOS SDK

LionIQ 数据狮专注于移动端电商插件开发，让任何APP快速完善电商功能。

## 简介
本iOS库包含: 

- `lib/Lioniq.framework` iOS 插件
- `example/LioniqDemo.xcodeproj` 简单接入示例，该示例仅供参考。

## 版本要求
iOS SDK 要求 iOS 8.0 及以上版本, 兼容 Swift 3.0 及 Objective-C. Swift 2.3 版本请参考 `swift-2.3` 分支.

## 安装

建议使用 Cocoapods 安装，也支持手动导入 Framework.

### 使用 CocoaPods
1. 在 `Podfile` 添加
    
    ````
        pod 'Lioniq'
    ````
    
    若是 Swift 2.3 请安装 `swift2.3` 分支如下: 

    ````
        pod 'Lioniq', :git => 'https://github.com/lioniq/lioniq-ios', :branch => 'swift2.3'
    ````

2. 运行 `pod install`


### 手动导入
1. 下载 SDK 后, 直接拖动 `lib/Lioniq.framework` 到项目录里。

2. 依赖 Frameworks：

    - 必需在工程中导入 `Lioniq.framework`

3. 添加Embedded Binaries: 

    在Xcode中，选择你的工程设置项: 

    - 选中 `"TARGETS"` 一栏, 在 `"General"` 标签栏, 在 `Embedded Binaries` 中添加这个 `Lioniq.framework`
    - 添加成功后会自动在 `Linked Framework and Libraries` 中自动添加这个 `Lioniq.framework`
    - 如果只在 `Linked Framework and Libraries` 中添加 `Lioniq.framwork` 会导致库无法载入。

4. 添加Copy Files: 

    - 在Xcode中，选择你的工程设置项
    - 选中 `"TARGETS"` 一栏, 在 `"Build Phases"` 标签栏, 点击 `+` 创建 `New Copy Files Phase` 项目
    - 设置 `Destination` 为 `Frameworks`, 点击 `+` 然后选择要 `Copy` 的此 `Lioniq.framework`

5. 在 Objective-C 项目中，因为此 framework 为 swift 编写，需要在 Xcode 中配置: 

    - 选择你的工程设置项
    - 选中 `"TARGETS"` 一栏
    - 在 `"Build Setting"` 标签栏
    - `Build Options` 设置 `Always Embed Swift Standard Libraries` 为 `Yes`.
    
## 商城集成

在 `ViewController` 中引入插件生成 `LIQWebview` 的实例就可以引入商城、及购物车界面。
(使用前请到官网后台申请生成 `APP` 的 `APP_KEY` 和 `APP_SECRET` 帐号权限)

想了解更多请查看[开发文档](http://docs.lioniq.com/)

````
import UIKit
import Lioniq

class ShopViewController: UIViewController {

    // Storyboard 添加一个普通 View 作为占位 (目前无法直接 Storyboard 使用)
    @IBOutlet weak var webviewPlaceholder: UIView!

    // 插件 webview 
    var liqview: LIQView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 针对 storyboard 7plus/6plus bug
        self.webviewPlaceholder.frame = self.view.frame 

        // 添加到本view
        self.liqview = LIQView(frame: webviewPlaceholder.frame)
        self.view.addSubview(self.liqview)

        // LionIQ 单列管理对象
        let liqManager = LIQManager.defaultManager
        liqManager.setAppKey(appKey: "我的_APP_KEY", appSecret: "我的_APP_SECRET")

        // 设置代理
        self.liqview.delegate = self 

        // 实现商城
        self.liqview.reloadShop

        // OPTIONAL 可选: 
        // 自动更新模版
        liqManager.getUpdates()

        // OPTIONAL 可选: 
        // 载入商城离线信息, 从后台下载保存为 shop_data.json 后拉进项目即可
        if let shopDataUrl = Bundle.main.url(forResource: "shop_data", withExtension: "json") {
            liqManager.setShopData(shopDataURL: shopDataUrl)
        }
    }
}
````

### 购物车集成 CartViewController

购物车一样使用 `LIQView` 就可以实现，使用 `reloadCart()` 即可。LionIQ 不需要另外登陆也不需要迁移你的用户信息，所有购物车只需要用户ID，用 `LIQManager` 的 `setAppUserId` 方式。

````
import UIKit
import Lioniq

class CartViewController: UIViewController {

    // Storyboard 添加一个普通 View 作为占位 (目前无法直接 Storyboard 使用)
    @IBOutlet weak var webviewPlaceholder: UIView!

    // 插件 webview 
    var liqview: LIQView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 针对 storyboard 7plus/6plus bug
        self.webviewPlaceholder.frame = self.view.frame 

        // 添加到本view
        self.liqview = LIQView(frame: webviewPlaceholder.frame)
        self.view.addSubview(self.liqview)

        // 设置代理
        self.liqview.delegate = self 

        // 实现购物车
        self.liqview.reloadCart
    }

    overide func viewDidAppear() {
        // 购物车出现时通知用户登陆状态
        LIQManager.defaultManager.setAppUserId(appUserId: "USER_ID")
        self.liqview.refreshShopUser()
    }
}
````

### 搜索集成 SearchViewController

商城搜索组件，可以查看项目 Demo 项目在商城页面的搜索框绑定点击事件过度到搜索页面。点击 Cancel 按钮后可以通过代理方式 pop 回到商城。

````
import UIKit
import Lioniq

class SearchViewController: UIViewController {
    // Storyboard 添加一个普通 View 作为占位 (目前无法直接 Storyboard 使用)
    @IBOutlet weak var webviewPlaceholder: UIView!

    // 插件 webview 
    var liqview: LIQView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 针对 storyboard 7plus/6plus bug
        self.webviewPlaceholder.frame = self.view.frame 

        // 添加到本view
        self.liqview = LIQView(frame: webviewPlaceholder.frame)
        self.view.addSubview(self.liqview)

        // 设置代理
        self.liqview.delegate = self 

        // 实现搜索
        self.liqview.reloadSearch
    }
}

extension SearchViewController: LIQViewDelegate {
    // 点击取消后 pop 回到商城页面
    func webviewDidCancel() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}

````


### 支付处理  PaymentViewController

LionIQ 插件收到消费者结算下订单后会回传订单对象回给APP, 这时可以透过代理方式解析 `orderData` 的 `JSON` 字典。以下是我们在生产运行中的APP使用的范例: 

想了解更多请查看[开发文档](http://docs.lioniq.com/)

````
    /** 
        CartViewController.swift

        购物车结算界面跳转至 PaymentViewController 会传值`orderData: Dictionary<String, AnyObject>`到 PaymentViewController
    **/
    func webviewDidOrder(_ orderData: Dictionary<String, AnyObject>) {
        self.performSegue(withIdentifier: "payment", sender: orderData)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "payment" {
            let paymentVC = segue.destination as! PaymentViewController
            paymentVC.orderData = sender as! Dictionary<String, AnyObject>?
        }
    }

````

然后在支付界面 `PaymentViewController` 解析订单信息，可以提供按钮给用户支付（如: 支付宝、微信、百度钱包、等等)

````

    /**
        PaymentViewController.swift

        支付页面通常需要生成请求参数提交给支付平台. Pingxx 支付SDK需要以下参数: 
            - channel: String, 支付渠道
            - orderNo: String, 订单号码
            - amount: Int, 订单金额
    **/

    // 订单号
    let orderNo = orderData["order_no"] as? String

    // 实付款金额
    let payableAmount = orderData["total_amount"] as? Int

    // 渠道
    let channel = "alipay" 

    // 订单产品列表项 - 用于显示订单产品
    let orderItems = orderData["cart_items"] as? Dictionary<String, AnyObject>

````


**关于如何使用 SDK 请参考 [开发者中心](http://docs.lioniq.com/)**

欢迎加入官方QQ技术群: 258693280

或邮件: dev@lioniq.com





