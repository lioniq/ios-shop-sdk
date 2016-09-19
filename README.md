# LioniqFrameWork ios SDK

## 简介
example 文件夹里面是一个简单的接入示例，该示例仅供参考。

## 版本要求
ios SDK 要求  ios 8.0 及以上版本

## 接入方法
#### 安装
#### 使用 CocoaPods
#### 待完善

#### 手动导入
1. 获取 SDK
下载 SDK, 里面包含了 lib 文件夹和 example 文件夹。lib 文件夹里面是 SDK 的文件。
2. 依赖 Frameworks：
    必需在工程中导入:
    ```
    LioniqFrameWork.framework
    ```
3. 添加App Transport Security Settings：在 Xcode 中选择Info.plist文件，添加key: NSAllowsArbitraryLoads, value:设置为true.解决在iOS9下基于ATS对HTTP的请求的说明及适配进行说明.否则webview内容无法显示。
4. 添加Embedded Binaries: 在Xcode中，选择你的工程设置项，选中 "TARGETS" 一栏，在 "General" 标签栏,在target ->General ->Embedded Binaries 中添加这个framework,添加成功后会自动在Linked Framework and Libraries中自动添加这个framework,如果只在Linked Framework and Libraries中添加这个framework会导致库无法载入。
5. 添加Copy Files: 在Xcode中，选择你的工程设置项，选中 "TARGETS" 一栏，在 "Build Phases" 标签栏,点击 + 创建 New Copy Files Phase 项目，设置 Destination 为 Frameworks，点击 + 然后选择要Copy的此framework。
6.swift 项目：在 `viewController` 中引入 `import LioniqFrameWork` 生成 `LIQWebview` 的实例就可以使用`LIQWebview` 的 `public function` 创建商城和购物车界面. 在使用之前请去后台申请生成App的 `appKey` 和 `appSecret` 示例代码如下：
````
import UIKit
import LioniqFrameWork

class ShopViewController: UIViewController {
    var wv: LIQWebview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wv = LIQWebview(frame: UIScreen.mainScreen().bounds)
        self.wv?.reloadShop("你的_APP_KEY", secret: "你的_APP_SECRET", userId: "用户_User_ID")
        self.view.addSubview(wv!)
    }
}
````

7.Objective-C 项目：在 `viewController.h` 引入 `@import LioniqFrameWork` 生成 `LIQWebview` 的实例.示例代码如下：

````
#import "ShopViewController.h"

@interface ShopViewController ()

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wk = [[LIQWebview alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.wk reloadShop:@"你的_APP_KEY" secret:@"你的_APP_SECRET" userId:@"用户_User_ID"];
    [self.view addSubview: self.wk];
}

@end
````


### 额外配置
在object-c项目中,因为此framework为swift编写，需要在Xcode中，选择你的工程设置项，选中 "TARGETS" 一栏, 在 "Build Setting" 标签栏, Build Options,设置Always Embed Swift Standard Libraries 为 Yes.


**关于如何使用 SDK 请参考 [开发者中心]()。**


