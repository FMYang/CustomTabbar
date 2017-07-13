
### 自定义Tabbar的二种方案

方案一：
隐藏系统的Tabbar，使用自定义的View代替Tabbar
优点：使用自定义的View，tabbar的风格完全自由设计，全部为图片，图片加文字，随意组合都非常方便
缺点：tabbar隐藏和显示的动画效果很难做到与原生媲美，特别是右滑返回手势的时候，tabbar的隐藏和显示动画很难控制

方案二：
使用KVC用自定义的Tabbar替换掉系统的Tabbar
优点：tabbar隐藏和显示的动画与系统一直
缺点：由于使用KVC的方式，万一系统的tabbar属性改名或者改为禁止使用KVC替换，该方案就会失效

[CYLTabBarController](https://github.com/ChenYilong/CYLTabBarController)的实现思路就是基于第二种方案的

### 实现原理

#### 一、隐藏系统的Tabbar
思路就是定义一个UITabbarController的子类，然后遍历UITabbarController.view的子视图，如果子视图的类型为Tabbar的类型就从父视图移除，注意：如果是隐藏的话，会有出现黑条的bug

具体实现如下：

我们定义一个CSTabBarController的类继承UITabBarController

UITabBarController.m文件

```objcet-C
@implementation CSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self hideSystemTabbar];
}

#pragma mark - 隐藏系统的tabbar
- (void)hideSystemTabbar
{
	  [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];		
	
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view removeFromSup
erview];
            break;
        }
    }
}
```
这种方案可以实现类似知乎APP的效果

![zhihu](https://github.com/FMYang/FMYang.github.io/blob/master/media/zhihu-1.gif)

demo效果图：
![zhihu1](https://github.com/FMYang/FMYang.github.io/blob/master/media/zhihu1.gif)

<!--more-->

#### 二、使用KVC
思路就是定义一个自己的Tabbar继承系统的UITabbar，在layoutSubViews方法里重新布局UITabbarButton的frame，以及加上自定义的按钮，定义一个UITabbarController的子类，在子类里面使用KVC替换系统UITabbar

具体实现如下：

定义一个UITabbar的子类CTTabBar

CTTabBar.m

```objcet-C
@implementation CTTabbar

//核心代码
- (void)layoutSubviews
{
    [super layoutSubviews];
    
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
            
            //只支持items为偶数个，比如有5个button，items.count为4，加上中间按钮共5个
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

@end
```

定义一个UITabbarController的子类CTTabBarController

CTTabBarController.m

```objcet-C
#pragma mark - private method
- (void)setupCustomTabbar
{
    CTTabbar *tabbar = [[CTTabbar alloc]init];
    
    tabbar.centerBtnWidth = 60;
       
    tabbar.centerBtnClickBlock = ^() {
        NSLog(@"centerBtnClick");
    };
    
    //核心代码，使用KVC替换系统的UITabbar
    [self setValue:tabbar forKey:@"tabBar"];
}

- (void)setCustomViewControllers:(NSArray *)customViewControllers
{
    for(UINavigationController *nav in customViewControllers)
    {
        [self addChildViewController:nav];
    }
    
    [self setupCustomTabbar];
}

```

可实现类似新浪微博客户端的效果：

![weibo](https://github.com/FMYang/FMYang.github.io/blob/master/media/weibo.gif)

demo效果图：

图1

![weibo1](https://github.com/FMYang/FMYang.github.io/blob/master/media/weibo1.gif)

图2
![weibo2](https://github.com/FMYang/FMYang.github.io/blob/master/media/weibo2.gif)


对于凸起的按钮还要处理触摸手势，需要重写hitTest方法，具体细节请看[demo](https://github.com/FMYang/CustomTabbar)


