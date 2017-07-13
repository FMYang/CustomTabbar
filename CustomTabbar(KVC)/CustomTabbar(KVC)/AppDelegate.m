//
//  AppDelegate.m
//  CustomTabbar(KVC)
//
//  Created by 杨方明 on 17/7/12.
//  Copyright © 2017年 杨方明. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeVC.h"
#import "MessageVC.h"
#import "FindVC.h"
#import "MineVC.h"

#import "CTTabbarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self setupRootViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)setupRootViewController
{
    HomeVC *homeVC = [[HomeVC alloc]init];
    homeVC.title = @"首页";
    homeVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home_normal"];
    homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    MessageVC *messageVC = [[MessageVC alloc]init];
    messageVC.title = @"消息";
    messageVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_normal"];
    messageVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_message_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:messageVC];
    
    FindVC *findVC = [[FindVC alloc]init];
    findVC.title = @"发现";
    findVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_find_normal"];
    findVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_find_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:findVC];
    
    MineVC *mineVC = [[MineVC alloc]init];
    mineVC.title = @"我的";
    mineVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_mine_normal"];
    mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:mineVC];
    
    CTTabbarController *tabbarController = [[CTTabbarController alloc]init];
    tabbarController.customViewControllers = @[nav1, nav2, nav3, nav4];
    
    self.window.rootViewController = tabbarController;

}

@end
