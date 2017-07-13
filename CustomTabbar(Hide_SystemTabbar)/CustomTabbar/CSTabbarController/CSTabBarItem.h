//
//  CSTabBarItem.h
//  CustomTabbar
//
//  Created by 杨方明 on 15/7/24.
//  Copyright (c) 2015年 云润大数据. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSTabBarItem : UIButton

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLb;

@property (nonatomic, strong) UIImage *normalImage;

@property (nonatomic, strong) UIImage *selectedImage;

@property (nonatomic, strong) UIColor *normalTitleColor;

@property (nonatomic, strong) UIColor *selectedTitleColor;

//设置选中未选中的图片，标题（需要定制选中未选中的颜色，调用下面的方法）
-(void)setNormalImage:(UIImage *)aNormalImage
        selectedImage:(UIImage *)aSelectedImage
                title:(NSString *)aTitle;

//设置选中未选中的图片，选中未选中标题颜色
-(void)setNormalImage:(UIImage *)aNormalImage
        selectedImage:(UIImage *)aSelectedImage
                title:(NSString *)aTitle
     normalTitleColor:(UIColor *)aNormalColor
selectedTitleColor:(UIColor *)aSelectedColor;

@end
