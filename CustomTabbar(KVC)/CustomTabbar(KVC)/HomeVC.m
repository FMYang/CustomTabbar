//
//  HomeVC.m
//  CustomTabbar(KVC)
//
//  Created by 杨方明 on 17/7/13.
//  Copyright © 2017年 杨方明. All rights reserved.
//

#import "HomeVC.h"
#import "TestVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(100, 100, 100, 40);
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick
{
    TestVC *testVC = [[TestVC alloc]init];
    testVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:testVC animated:YES];
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
