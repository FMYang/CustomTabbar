//
//  SNNavigationController.m
//  SinaweiboDemo
//
//  Created by 杨方明 on 15/7/10.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "SNNavigationController.h"
#import "UIViewController+HideCustomTabbar.h"

@interface SNNavigationController ()

@end

@implementation SNNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0)
    {//若viewController不是根视图控制器，push的时候隐藏tabbar
        viewController.hideCustomTabbar = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
