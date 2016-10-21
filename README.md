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
        pod 'lioniq', '~> 0.3.0'
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
    
**关于如何使用 SDK 请参考 [开发者中心](http://docs.lioniq.com/)。**

Help

欢迎加入官方QQ技术群: 258693280

或邮件: dev@lioniq.com



PaymentViewController:
    - 购物车结算界面跳转至 PaymentViewController, 传值`orderData: Dictionary<String, AnyObject>`到 PaymentViewController
````
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


    - PaymentViewController JSON对象转成orderData: Dictionary<String, AnyObject>, orderData 包含order的所有信息:
````
`orderData`

key | value | notes
----|-------|-------
`key` | `String` | id
`order_no` | `String` | 订单号码
`cart_items` | `[cartItemData]` | 购物列表项数组
`address` | `addressData` | 地址对象
`subtotal_amount` | `int` | 订单小计 (产品单价 x 数量，未计运费). 1 = ¥1.00
`shipping_amount` | `int` | 运费总额. 1 = ¥1.00
`total_amount` | `int` | 订单总金额. 1 = ¥1.00
`fapiao` | `String` | 发票抬头
`created_at` | `DateTime` | 订单下定日期
`updated_at` | `DateTime` | 订单更新日期

````



    - 解析 orderData: Dictionary<String, AnyObject>
````
// 订单key
let orderKey = orderData["key"] as? String

// 实付款金额
let payableAmount = orderData["total_amount"] as? Int

// 订单号
let orderNo = orderData["order_no"] as? String

````



    - 接入支付SDK, 生成Charge对象
````

// init charge object, and send to API
let charge = ChargeData(channel: channel, orderNo: orderNo, orderKey: orderKey, amount: payableAmount)

+ params

param | class | notes
------|-------|--------
`channel` | `String` | 支付渠道，如"alipay","wx"等，具体请查看Pingpp开发者文档
`orderNo` | `String` | 订单编号
`payableAmount` | `Int` | 付款金额

````





