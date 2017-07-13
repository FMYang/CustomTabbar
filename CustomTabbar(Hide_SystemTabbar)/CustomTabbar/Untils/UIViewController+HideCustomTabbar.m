//
//  UIViewController+Extend.m
//  CustomTabbar
//
//  Created by 杨方明 on 15/7/22.
//  Copyright (c) 2015年 杨方明. All rights reserved.
//

#import "UIViewController+HideCustomTabbar.h"
#import <objc/runtime.h>

static const NSString *kHideCustomTabbarKey = @"hideCustomTabbarKey";

@implementation UIViewController (HideCustomTabbar)
@dynamic hideCustomTabbar;

- (BOOL)hideCustomTabbar
{
    NSNumber *number = objc_getAssociatedObject(self, &kHideCustomTabbarKey);
    return [number boolValue];
}

- (void)setHideCustomTabbar:(BOOL)newHideCustomTabbar
{
    objc_setAssociatedObject(self, &kHideCustomTabbarKey, [NSNumber numberWithBool:newHideCustomTabbar], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
