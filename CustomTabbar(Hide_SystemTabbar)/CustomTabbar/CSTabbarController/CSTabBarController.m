//
//  CSTabBarController.m
//  CustomTabbar
//
//  Created by 杨方明 on 15/7/22.
//  Copyright (c) 2015年 杨方明. All rights reserved.
//

#import "CSTabBarController.h"
#import "HomeVC.h"
#import "MessageVC.h"
#import "FindVC.h"
#import "MineVC.h"

#import "OtherVC.h"
#import "UIViewController+HideCustomTabbar.h"
#import "SNNavigationController.h"
#import "UIView+Expand.h"

#import "CSTabBarItem.h"

#define kTabbarH 44
#define kBtnW (kScreenWidth/5)
#define KBtnH 44

@interface CSTabBarController ()
{
    HomeVC *homeVC;
    MessageVC *messageVC;
    FindVC *findVC;
    MineVC *mineVC;
    CSTabBarItem *homeBtn;
    CSTabBarItem *messageBtn;
    CSTabBarItem *findBtn;
    CSTabBarItem *mineBtn;
    UIButton *otherBtn;
    NSInteger selectIndex;
    UIImageView *tabBarBg;
    BOOL tabBarIsShow;

}
@end

@implementation CSTabBarController

#pragma mark - lify cycle
- (instancetype)init
{
    if(self = [super init])
    {
        selectIndex = 0;
        tabBarIsShow = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self hideSystemTabbar];
    
    homeVC = [[HomeVC alloc]init];
    messageVC = [[MessageVC alloc]init];
    findVC = [[FindVC alloc]init];
    mineVC = [[MineVC alloc]init];
    
    homeVC.hidesBottomBarWhenPushed = YES;
    messageVC.hidesBottomBarWhenPushed = YES;
    findVC.hidesBottomBarWhenPushed = YES;
    mineVC.hidesBottomBarWhenPushed = YES;
    
    SNNavigationController *homeNav = [[SNNavigationController alloc]initWithRootViewController:homeVC];
    homeNav.delegate = self;
    SNNavigationController *messageNav = [[SNNavigationController alloc]initWithRootViewController:messageVC];
    messageNav.delegate = self;
    SNNavigationController *findNav = [[SNNavigationController alloc]initWithRootViewController:findVC];
    findNav.delegate = self;
    SNNavigationController *mineNav = [[SNNavigationController alloc]initWithRootViewController:mineVC];
    mineNav.delegate = self;
    
    self.viewControllers = @[homeNav, messageNav, findNav, mineNav];
    

    tabBarBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, kScrrenHeight-kTabbarH, kScreenWidth, kTabbarH)];
    tabBarBg.backgroundColor = [UIColor whiteColor];
    tabBarBg.userInteractionEnabled = YES;
    [self.view addSubview:tabBarBg];
    
    homeBtn = [[CSTabBarItem alloc]initWithFrame:CGRectMake(0, 0 , kBtnW, KBtnH)];
    homeBtn.tag = 0;
    [homeBtn setNormalImage:[UIImage imageNamed:@"tabbar_home"]
              selectedImage:[UIImage imageNamed:@"tabbar_home_selected"]
                      title:@"首页"];
//    homeBtn.adjustsImageWhenHighlighted = NO;
//    [homeBtn setImage:[UIImage imageNamed:@"tabbar_home"] forState:UIControlStateNormal];
//    /*如果点击的是已经选中的按钮（isSelected=YES），那么再次点击的时候button的状态为
//     UIControlStateSelected|UIControlStateHighlighted（高亮或者选中状态）*/
//    [homeBtn setImage:[UIImage imageNamed:@"tabbar_home_selected"] forState:UIControlStateSelected| UIControlStateHighlighted];
//    [homeBtn setImage:[UIImage imageNamed:@"tabbar_home_selected"] forState:UIControlStateSelected];
    [homeBtn addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBg addSubview:homeBtn];
    homeBtn.selected = YES;
    
    messageBtn = [[CSTabBarItem alloc]initWithFrame:CGRectMake(1*kBtnW, 0, kBtnW, KBtnH)];
    messageBtn.tag = 1;
    [messageBtn setNormalImage:[UIImage imageNamed:@"tabbar_message"]
              selectedImage:[UIImage imageNamed:@"tabbar_message_selected"]
                         title:@"消息" ];
    [messageBtn addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBg addSubview:messageBtn];
    
    findBtn = [[CSTabBarItem alloc]initWithFrame:CGRectMake(3*kBtnW, 0, kBtnW, KBtnH)];
    findBtn.tag = 3;
    [findBtn setNormalImage:[UIImage imageNamed:@"tabbar_find"]
              selectedImage:[UIImage imageNamed:@"tabbar_find_selected"]
                      title:@"发现"];
    [findBtn addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBg addSubview:findBtn];
    
    mineBtn = [[CSTabBarItem alloc]initWithFrame:CGRectMake(4*kBtnW, 0, kBtnW, KBtnH)];
    mineBtn.tag = 4;
    [mineBtn setNormalImage:[UIImage imageNamed:@"tabbar_mine"]
              selectedImage:[UIImage imageNamed:@"tabbar_mine_selected"]
                      title:@"我的"];
    [mineBtn addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [tabBarBg addSubview:mineBtn];
    
    otherBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, KBtnH, KBtnH)];
    otherBtn.backgroundColor = [UIColor grayColor];
    otherBtn.center = CGPointMake(kScreenWidth*0.5, kScrrenHeight-kTabbarH);
    [SystemSetting setViewLayer:otherBtn radius:KBtnH*0.5 borderWidth:1 borderColor:[UIColor blackColor]];
    otherBtn.tag = 2;
    [otherBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [otherBtn setTitle:@"凸起" forState:UIControlStateNormal];
    [otherBtn addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:otherBtn];
}

#pragma mark - 隐藏系统的tabbar
- (void)hideSystemTabbar
{
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view removeFromSuperview];
            break;
        }
    }
}

#pragma mark - 自定义tabbar按钮点击事件
- (void)tabBarBtnClick:(UIButton *)btn
{
    if(btn.tag == 2)
    {
        OtherVC *otherVC = [[OtherVC alloc]init];
        [self.navigationController pushViewController:otherVC animated:YES];
    }
    else
    {
        self.selectedViewController = self.viewControllers[(btn.tag>2)?btn.tag-1:btn.tag];
        
        if(btn.tag != selectIndex)
        {
            for(UIView *view in tabBarBg.subviews)
            {
                if([view isKindOfClass:[UIButton class]])
                {
                    UIButton *button = (UIButton *)view;
                    button.selected = NO;
                }
            }
            
            btn.selected = YES;
            selectIndex = btn.tag;
        }
    }
}

#pragma mark - 导航栏代理
- (void)navigationController:(UINavigationController *)navController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(navController.viewControllers.count > 1)
    {
        if(viewController.hideCustomTabbar)
        {
            [self hideTabBar];
        }
    }
}

- (void)navigationController:(UINavigationController *)navController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(navController.viewControllers.count == 1)
    {//若viewController不是根视图控制器，push的时候隐藏tabbar
        [self showTabBar];
    }
    else if(navController.viewControllers.count > 1)
    {
        if(!viewController.hideCustomTabbar)
        {
            [self showTabBar];
        }
    }
}

#pragma mark - 隐藏自定义的导航栏
- (void)hideTabBar {
    
    if (!tabBarIsShow)
    { //已经隐藏不操作
        return;
    }
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         tabBarBg.y = kScrrenHeight;
                         otherBtn.y = kScrrenHeight;
//                         tabBarBg.x = -kScreenWidth;
//                         otherBtn.centerX = -kScreenWidth/2;
                     }];
    
    tabBarIsShow = NO;
}

#pragma mark - 显示自定义的导航栏
- (void)showTabBar {
    
    if (tabBarIsShow)
    { //已经显示不操作
        return;
    }
    tabBarBg.contentMode = UIViewContentModeRight;
    [UIView animateWithDuration:0.25
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         tabBarBg.y = kScrrenHeight - kTabbarH;
                         otherBtn.centerY = kScrrenHeight - kTabbarH;
//                         tabBarBg.x = 0;
//                         otherBtn.centerX = kScreenWidth/2;
                     }];
    
    tabBarIsShow = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
