# RanMall_flutter

商城flutter版
(```)
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.0
  dio: ^3.0.9
  flutter_swiper: ^1.1.6
  crypto: ^2.0.6
(```)

## Getting Started
![详情](https://github.com/MysteryRan/RanMall_flutter/blob/master/images/1.png "界面")
![购物车](https://github.com/MysteryRan/RanMall_flutter/blob/master/images/4.png "界面")
![双十一](https://github.com/MysteryRan/RanMall_flutter/blob/master/images/2.png "界面")
![购物车](https://github.com/MysteryRan/RanMall_flutter/blob/master/images/3.png "界面")

### 创建flutter项目

1. flutter create myapp
2. cd myapp
3. flutter run

### 原生项目添加flutter模块

#### 添加flutter模块

1. flutter create -t module flutter_module
2. flutter attach

#### 原生项目修改podfile

(```)
flutter_application_path = '../my_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'targetName' do
  //# Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  install_all_flutter_pods(flutter_application_path)

end
(```)

#### 添加代码

(```)
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
      // Runs the default Dart entrypoint with a default Flutter route.
      [self.flutterEngine run];
      // Used to connect plugins (only if you have plugins with iOS platform code).
      [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    return YES;
}
(```)

#### 加载部分界面

(```)
    FlutterEngine *flutterEngine =
            ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    self.flutterViewController =
            [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    self.flutterViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:self.flutterViewController];
    [self.view addSubview:self.flutterViewController.view];
(```)
