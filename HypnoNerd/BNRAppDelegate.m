//
//  BNRAppDelegate.m
//  HypnoNerd
//
//  Created by AndyYou on 2014/6/25.
//  Copyright (c) 2014年 AndyYou. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisViewController.h"
#import "BNRReminderViewController.h"
#import "BNRQuizViewController.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    BNRHypnosisViewController *hvc = [[BNRHypnosisViewController alloc] init];
    /*
    NSBundle *appBundle = [NSBundle mainBundle];
    BNRReminderViewController *rvc = [[BNRReminderViewController alloc] initWithNibName:@"BNRReminderViewController" bundle:appBundle];
     */
    BNRReminderViewController *rvc = [[BNRReminderViewController alloc] init];
    
    BNRQuizViewController *qvc = [[BNRQuizViewController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[hvc, rvc, qvc];
    
    self.window.rootViewController = tabBarController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    /* note
     當 app 啟動之後
     1. 進入 main()
     2. 執行 UIApplicationMain()，回傳一個 application 物件
     3. 載入 info.plist 中的 main nib (ui file)
     3. 執行 Delegate 代理物件，所以可以在 AppDelegate 的 Event 影響 App 操作
     4. application.window 需要初始化設定 application.window
        window 有三種方式顯示畫面
            - subviews(UIView, UIScrollView, ..etc) e.g. [self addSubview: view]
            - drawRect: 方法
            - 設定 application.rootViewController
                * rootViewController 有一個 (UIView *) view 屬性必須要加入元素或載入 nib 才有畫面
                * 也可以複寫 UIViewController 本身類別的方法 loadView 實際上執行的動作就是 self.view = [Your UIView Object]
                * UIViewController 類別中最重要的屬性就是 UIViewController.view 型別為 UIView
                * UIViewController 有兩種方式來建立畫面
                    - 1. 程式碼
                    - 2. nib, xib
        以上處理都會在 Delegate 事件處理 e.g. willFinishLaunchingWithOptions:, didFinishLaunchingWithOptions:
     5. 完成初始化進入 applicationDidBecomeActive:
     6. 進入 Run Loop 等待處理事件
     */
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
