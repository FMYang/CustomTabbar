//
//  OtherVC.m
//  CustomTabbar
//
//  Created by 杨方明 on 15/7/22.
//  Copyright (c) 2015年 杨方明. All rights reserved.
//

#import "OtherVC.h"
#import "UIViewController+HideCustomTabbar.h"
#import "UIColor+Expand.h"

@interface OtherVC ()

@end

@implementation OtherVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHex:0xf2f2f2];
    
    self.title = @"Other";
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
