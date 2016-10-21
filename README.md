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
pod 'lioniq'
````

若是 Swift 2.3 请安装 `swift2.3` 分支如下: 

````
pod install 'Lioniq', :git => 'https://github.com/lioniq/lioniq-ios', :branch => 'swift2.3'
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

### 支付处理  PaymentViewController

LionIQ 插件收到消费者结算下订单后会回传订单对象回给APP, 这时可以透过代理方式解析 `orderData` 的 `JSON` 字典。以下是我们在生产运行中的APP使用的范例: 

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





