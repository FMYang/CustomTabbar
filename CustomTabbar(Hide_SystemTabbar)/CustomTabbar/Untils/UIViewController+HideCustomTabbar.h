//
//  UIViewController+Extend.h
//  CustomTabbar
//
//  Created by 杨方明 on 15/7/22.
//  Copyright (c) 2015年 杨方明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HideCustomTabbar)

//给categroy设置属性
/*
 模拟系统的hidesBottomBarWhenPushed的实现，使用方式一样
 */
@property (nonatomic, assign) BOOL hideCustomTabbar;

@end
