//
//  CTTabbar.h
//  CustomTabbar(KVC)
//
//  Created by 杨方明 on 17/7/12.
//  Copyright © 2017年 杨方明. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CTCenterButtonStyle) {
    CTCenterButtonStyleNormal,  //方形
    CTCenterButtonStyleOval,    //圆形
};

typedef void(^CenterBtnClickBlock)();

@interface CTTabbar : UITabBar

@property (nonatomic, assign) CGFloat centerBtnWidth;

@property (nonatomic, assign) CGFloat centerBtnOffsetY;

@property (nonatomic, copy) CenterBtnClickBlock centerBtnClickBlock;

- (instancetype)initWithStyle:(CTCenterButtonStyle)style;

@end
