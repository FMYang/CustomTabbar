//
//  SystemSetting.m
//  CustomTabbar
//
//  Created by 杨方明 on 15/7/22.
//  Copyright (c) 2015年 杨方明. All rights reserved.
//

#import "SystemSetting.h"

@implementation SystemSetting

+ (void)setViewLayer:(UIView *)view radius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)color
{
    CALayer *layer = [view layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:radius];
    [layer setBorderWidth:width];
    [layer setBorderColor:[color CGColor]];
}


@end
