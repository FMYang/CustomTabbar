//
//  Level1VC.m
//  CustomTabbar
//
//  Created by 杨方明 on 15/7/23.
//  Copyright (c) 2015年 云润大数据. All rights reserved.
//

#import "Level1VC.h"
#import "UIColor+Expand.h"

@interface Level1VC ()

@end

@implementation Level1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Level1";
    self.view.backgroundColor = [UIColor colorWithHex:0xf2f2f2];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 60);
    [btn setTitle:@"Level2" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick
{
    Level2VC *level2VC = [[Level2VC alloc]init];
    //    otherVC.hideCustomTabbar = YES;
    [self.navigationController pushViewController:level2VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
