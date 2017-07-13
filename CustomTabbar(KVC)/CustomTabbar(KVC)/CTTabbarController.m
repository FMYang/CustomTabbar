//
//  CustomTabbarController.m
//  CustomTabbar(KVC)
//
//  Created by 杨方明 on 17/7/12.
//  Copyright © 2017年 杨方明. All rights reserved.
//

#import "CTTabbarController.h"

@interface CTTabbarController()

@end

@implementation CTTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private method
- (void)setupCustomTabbar
{
    CTTabbar *tabbar = [[CTTabbar alloc]init];
//    CTTabbar *tabbar = [[CTTabbar alloc]initWithStyle:CTCenterButtonStyleOval];
    
    tabbar.centerBtnWidth = 60;
    tabbar.centerBtnOffsetY = 10;
    
    tabbar.centerBtnClickBlock = ^() {
        NSLog(@"centerBtnClick");
    };
    
    [self setValue:tabbar forKey:@"tabBar"];
    
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
}

- (void)setCustomViewControllers:(NSArray *)customViewControllers
{
    for(UINavigationController *nav in customViewControllers)
    {
        [self addChildViewController:nav];
    }
    
    [self setupCustomTabbar];
}

@end
