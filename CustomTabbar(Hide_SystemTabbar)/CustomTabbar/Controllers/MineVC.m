//
//  MineVC.m
//  CustomTabbar
//
//  Created by 杨方明 on 15/7/24.
//  Copyright (c) 2015年 云润大数据. All rights reserved.
//

#import "MineVC.h"
#import "UIColor+Expand.h"
#import "Level1VC.h"

@interface MineVC ()

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Mine";
    self.view.backgroundColor = [UIColor colorWithHex:0xf2f2f2];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 60);
    [btn setTitle:@"Level1" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick
{
    Level1VC *level1VC = [[Level1VC alloc]init];
    //    otherVC.hideCustomTabbar = YES;
    [self.navigationController pushViewController:level1VC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
