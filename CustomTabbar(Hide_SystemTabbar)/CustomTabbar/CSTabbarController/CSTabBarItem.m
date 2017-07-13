//
//  CSTabBarItem.m
//  CustomTabbar
//
//  Created by 杨方明 on 15/7/24.
//  Copyright (c) 2015年 云润大数据. All rights reserved.
//

#import "CSTabBarItem.h"
#import "UIView+Expand.h"
#import "UIColor+Expand.h"

@implementation CSTabBarItem

@synthesize imageView;

@synthesize titleLb;

@synthesize normalImage;

@synthesize selectedImage;

- (instancetype)init
{
    if(self = [super init])
    {
        //do nothing
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        imageView.centerX = frame.size.width*0.5;
        imageView.centerY = frame.size.height*0.5-8;
        [self addSubview:imageView];
        
        titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 10)];
        titleLb.backgroundColor = [UIColor clearColor];
        titleLb.centerX = frame.size.width*0.5;
        titleLb.centerY = frame.size.height*0.5+12;
        titleLb.font = [UIFont systemFontOfSize:12];
        titleLb.textAlignment = NSTextAlignmentCenter;
        titleLb.tintColor = [UIColor darkGrayColor];
        [self addSubview:titleLb];
    }
    return self;
}

-(void)setNormalImage:(UIImage *)aNormalImage
        selectedImage:(UIImage *)aSelectedImage
                title:(NSString *)aTitle
{
    [self setNormalImage:aNormalImage selectedImage:aSelectedImage title:aTitle normalTitleColor:[UIColor darkGrayColor] selectedTitleColor:[UIColor colorWithHex:0xff8403]];
}

-(void)setNormalImage:(UIImage *)aNormalImage
        selectedImage:(UIImage *)aSelectedImage
                title:(NSString *)aTitle
     normalTitleColor:(UIColor *)aNormalColor
    selectedTitleColor:(UIColor *)aSelectedColor
{
    self.normalImage = aNormalImage;
    self.selectedImage = aSelectedImage;
    self.normalTitleColor = aNormalColor;
    self.selectedTitleColor = aSelectedColor;
    

    imageView.image = aNormalImage;
    titleLb.text = aTitle;
}

/*
 覆盖UIButton的setSelected方法
 */
- (void)setSelected:(BOOL)aSelected
{
    if(aSelected)
    {
        imageView.image = self.selectedImage;
        titleLb.textColor = self.selectedTitleColor;
    }
    else
    {
        imageView.image = self.normalImage;
        titleLb.textColor = self.normalTitleColor;
    }
}

@end
