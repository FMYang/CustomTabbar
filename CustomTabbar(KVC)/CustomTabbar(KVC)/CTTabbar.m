//
//  CTTabbar.m
//  CustomTabbar(KVC)
//
//  Created by 杨方明 on 17/7/12.
//  Copyright © 2017年 杨方明. All rights reserved.
//

#import "CTTabbar.h"

@interface CTTabbar()

@property (nonatomic, strong) UIButton *centerButton;

@property (nonatomic, assign) CTCenterButtonStyle style;

@end

@implementation CTTabbar

- (instancetype)init
{
    if(self = [super init])
    {
        _style = CTCenterButtonStyleNormal;
        
        [self addCenterButton];
    }
    
    return self;
}

- (instancetype)initWithStyle:(CTCenterButtonStyle)style
{
    if(self = [super init])
    {
        _style = style;
        
        [self addCenterButton];
    }
    
    return self;
}

- (void)addCenterButton
{
    _centerButton = [[UIButton alloc]init];
    _centerButton.backgroundColor = [UIColor orangeColor];
    
    [_centerButton setImage:[UIImage imageNamed:@"tabbar_add_normal"] forState:UIControlStateNormal];
    [_centerButton setImage:[UIImage imageNamed:@"tabbar_add_selected"] forState:UIControlStateSelected];
    
    _centerButton.clipsToBounds = YES;
    _centerButton.layer.masksToBounds = YES;
    
    [_centerButton addTarget:self action:@selector(centerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_centerButton];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = CGSizeMake((_style==CTCenterButtonStyleNormal)?_centerBtnWidth-8:_centerBtnWidth, (_style==CTCenterButtonStyleNormal)?self.frame.size.height-8:_centerBtnWidth);
    CGPoint point;
    
    if(_style == CTCenterButtonStyleOval)
    {
        point = CGPointMake(0.5*self.frame.size.width, 0.5*_centerBtnOffsetY);
    }
    else if(_style == CTCenterButtonStyleNormal)
    {
        point = CGPointMake(0.5*self.frame.size.width, 0.5*self.frame.size.height);
    }
    
    CGRect centerBtnRect = self.centerButton.frame;
    centerBtnRect.size = size;
    self.centerButton.frame = centerBtnRect;
    self.centerButton.center = point;
    
    if(_style == CTCenterButtonStyleOval) {
        self.centerButton.layer.cornerRadius = _centerBtnWidth*0.5;
    }
    
    int index = 0;
    
    //重新布局tabbar按钮布局
    for(UIView *tabBarButton in self.subviews)
    {
        if([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            CGFloat btnWidth = (self.frame.size.width-self.centerBtnWidth) / self.items.count;
            CGFloat btnHeight = self.frame.size.height;
            
            CGRect btnRect = tabBarButton.frame;
            btnRect.size.width = btnWidth;
            btnRect.size.height = btnHeight;
            
            //只支持items为偶数个，比如有5个button，items.count为4，加上中间按钮共5个（一般中间按钮需要订制的，button都未奇数个）
            if(index >= self.items.count/2)
            {
                btnRect.origin.x = btnWidth*index+_centerBtnWidth;
            }
            else
            {
                btnRect.origin.x = btnWidth*index;
            }
            
            tabBarButton.frame = btnRect;
            
            index++;
        }
    }
}

//中间按钮点击回调方法
- (void)centerBtnClick
{
    if(_centerBtnClickBlock)
    {
        _centerBtnClickBlock();
    }
}

//重写hitTest方法，控制中间按钮的点击区域
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //1. 边界情况：不能响应点击事件
    BOOL canNotResponseEvent = self.hidden || (self.alpha <= 0.01f) || (self.userInteractionEnabled == NO);
    if (canNotResponseEvent) {
        return nil;
    }
    
    //转换中间按钮相对tabbar的坐标
    CGPoint newPoint = [self convertPoint:point toView:self.centerButton];
    
    switch (_style) {
            
        case CTCenterButtonStyleNormal:
        {
            //获取中间按钮的点击区域
            if([self.centerButton pointInside:newPoint withEvent:event])
            {
                return self.centerButton;
            }
        }
            break;
            
        case CTCenterButtonStyleOval:
        {
            //获取中间圆形按钮的点击区域
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.centerButton.bounds];
            
            //如果触摸点落在圆形按钮的点击区域，那么点击的是圆形按钮
            if([path containsPoint:newPoint])
            {
                return self.centerButton;
            }
        }
            break;
    }
    
    return [super hitTest:point withEvent:event];
}

@end
