//
//  CustomTabBarViewController.m
//  TabBarDome
//
//  Created by farben on 15/7/21.
//  Copyright (c) 2015年 ZZning. All rights reserved.
//

#import "ZZTabBar.h"

@interface ZZTabBar ()

/**
 *  传入自定义NavigationControlls类名
 *
 *  @discussion
 *  假如你使用的Controller 不需要 UINavigationControll 那么请忽略这个参数
 *  假如你使用的是系统原生态的 UINavigationControll 那么 你需要传入 @"UINavigationController"
 *  假如你使用的是自定义的 UINavigationControll 那么需要将你定制的 UINavigationControll 类名以字符串形式传入
 *
 */
@property (nonatomic, strong) NSString          *sNavigationControlls;


/**
 *  传入TabBar 控制层的类名
 *
 *  @discussion
 *
 *  Example:
 *  self.arrayControlls = @[@"控制类名1", @"控制类名2", @"控制类名3", @"控制类名4"];
 *
 */
@property (nonatomic, strong) NSArray    *arrayControlls;

@property (nonatomic, strong) NSMutableArray    *arrayControllTabBarItem;

@end

@implementation ZZTabBar

static  ZZTabBar* CustomTabBarVC;
+ (instancetype)sharedInstance
{
    return CustomTabBarVC;
}

+ (instancetype)sharedInstance:(NSString *)sNavigationControlls
               arrayController:(NSArray  *)arrayController
{
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        CustomTabBarVC = [[ZZTabBar alloc] initWithsNavigationControlls:sNavigationControlls arrayController:arrayController];
    });
    return CustomTabBarVC;
}

- (instancetype)initWithsNavigationControlls:(NSString *)sNavigationControlls
                             arrayController:(NSArray *)arrayController
{
    self = [super init];
    if (self) {
        _sNavigationControlls = sNavigationControlls;
        self.arrayControlls = arrayController;
    }
    return self;
}



- (void)installItemImageAndTitle:(NSArray *)arrayImgAndTitle
{
    [self reloadItemImageAndTitle:arrayImgAndTitle BackgroundImage:nil TitleCancelColor:nil TitleSelectColor:nil TitleFont:0];
}


- (void)installItemImageAndTitle:(NSArray *)arrayImgAndTitle
                 BackgroundImage:(NSString *)sBackGround
{
    [self reloadItemImageAndTitle:arrayImgAndTitle BackgroundImage:sBackGround TitleCancelColor:nil TitleSelectColor:nil TitleFont:0];
}

- (void)installItemImageAndTitle:(NSArray  *)arrayImgAndTitle
                TitleCancelColor:(UIColor  *)textCancelColor
                TitleSelectColor:(UIColor  *)textSelectColor
                       TitleFont:(NSInteger )iFont
{
    [self reloadItemImageAndTitle:arrayImgAndTitle BackgroundImage:nil TitleCancelColor:textCancelColor TitleSelectColor:textSelectColor TitleFont:iFont];
}

- (void)installItemImageAndTitle:(NSArray  *)arrayImgAndTitle
                 BackgroundImage:(NSString *)sBackGround
                TitleCancelColor:(UIColor  *)textCancelColor
                TitleSelectColor:(UIColor  *)textSelectColor
                       TitleFont:(NSInteger )iFont
{
    [self reloadItemImageAndTitle:arrayImgAndTitle BackgroundImage:sBackGround TitleCancelColor:textCancelColor TitleSelectColor:textSelectColor TitleFont:iFont];
}


- (void)reloadItemImageAndTitle:(NSArray  *)arrayImgAndTitle
                BackgroundImage:(NSString *)sBackGround
               TitleCancelColor:(UIColor  *)textCancelColor
               TitleSelectColor:(UIColor  *)textSelectColor
                      TitleFont:(NSInteger )iFont
{
    
    
    NSArray *arrayControllers = self.viewControllers;
    
    if (self.arrayControllTabBarItem) {
        [self.arrayControllTabBarItem removeAllObjects];
    }
    
    [arrayControllers enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL *stop) {
        
        UITabBarItem *item = nil;
        NSArray *_itemData = arrayImgAndTitle[idx];
        
        item = [[UITabBarItem alloc] initWithTitle:_itemData[0] image:nil tag:idx];
        
        item.image = [[UIImage imageNamed:_itemData[1]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        item.selectedImage = [[UIImage imageNamed:_itemData[2]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
        
        // 改变tabBar中items上字体大小
        if (iFont != 0 && textCancelColor != nil && textSelectColor != nil) {
            
            [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:iFont],NSFontAttributeName,textCancelColor, NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
            
            [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:iFont],NSFontAttributeName,textSelectColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
        }
        else if (iFont != 0 && textCancelColor == nil && textSelectColor == nil)
        {
            [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:iFont],NSFontAttributeName,nil] forState:UIControlStateNormal];
            
            [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:iFont],NSFontAttributeName,nil] forState:UIControlStateSelected];
        }
        else if (iFont == 0 && textCancelColor != nil && textSelectColor != nil)
        {
            [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:textCancelColor,NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
            
            [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:textSelectColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
        }
        
        viewController.tabBarItem = item;
        
        [self.arrayControllTabBarItem addObject:viewController];
    }];
    
    
    // 设置tabBar的背景图片
    if (sBackGround != nil && sBackGround.length != 0) {
        UIImage* tabBarBackground = [UIImage imageNamed:sBackGround];
        [self.tabBar setBackgroundImage:[tabBarBackground resizableImageWithCapInsets:UIEdgeInsetsMake(24.5, 0, 24.5, 0) resizingMode:UIImageResizingModeStretch]];
    }
    self.viewControllers = self.arrayControllTabBarItem;
}


- (void)addRedDot:(NSInteger)iControllerType dotNumber:(NSInteger)iNumber
{
    NSArray *arrayControllerType = self.viewControllers;
    
    if (iControllerType < arrayControllerType.count) {
        
        if (iNumber > 99) {
            ((UIViewController *)arrayControllerType[iControllerType]).tabBarItem.badgeValue = @"99+";
        }
        else if (iNumber <= 0)
        {
            if (iNumber == 0) {
                [self removeRedDot:iControllerType];
            }
            else
            {
#ifndef DEBUG
                NSAssert(iNumber == 0, @"传入的 iNumber 不能小于0");
#else
                [self removeRedDot:iControllerType];
#endif
            }
        }
        else
        {
            ((UIViewController *)arrayControllerType[iControllerType]).tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",(long)iNumber];
        }
    }
    else
    {
#ifndef DEBUG
        NSAssert(iControllerType < arrayControllerType.count, @"传入的 iControllerType 大于实际数组的下标");
#endif
    }
}

- (void)removeRedDot:(NSInteger)iControllerType
{
    NSArray *arrayControllerType = self.viewControllers;
    
    if (iControllerType < arrayControllerType.count) {
        
        ((UIViewController *)arrayControllerType[iControllerType]).tabBarItem.badgeValue = nil;
    }
    else
    {
#ifndef DEBUG
        NSAssert(iControllerType < arrayControllerType.count, @"传入的 iControllerType 大于实际数组的下标");
#endif
    }
}

- (void)removeAllRedDot
{
    for (UIViewController *controller in self.viewControllers) {
        controller.tabBarItem.badgeValue = nil;
    }
}



#pragma mark - set And Get
- (NSMutableArray *)arrayControllTabBarItem
{
    if (!_arrayControllTabBarItem) {
        _arrayControllTabBarItem = [[NSMutableArray alloc] init];
    }
    return _arrayControllTabBarItem;
}

- (void)setArrayControlls:(NSArray *)arrayControlls
{
    _arrayControlls = arrayControlls;
    [_arrayControlls enumerateObjectsUsingBlock:^(NSString *sClassName, NSUInteger idx, BOOL * _Nonnull stop) {
        
        Class vController = NSClassFromString(sClassName);
        if (vController) {
            UIViewController *controll = [[vController alloc] init];
            
            if (_sNavigationControlls == nil || _sNavigationControlls.length == 0) {
                [self addChildViewController:controll];
            }
            else if ([_sNavigationControlls isEqualToString:@"UINavigationController"]) {
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controll];
                [self addChildViewController:navigationController];
            }
            else
            {
                Class navController = NSClassFromString(_sNavigationControlls);
                if (navController) {
                    UINavigationController *navigationController = [[navController alloc] initWithRootViewController:controll];
                    [self addChildViewController:navigationController];
                }
                else
                {
#ifndef DEBUG
                    NSAssert(navController, @"你传入的 NavigationController %@ 字符串有问题",_sNavigationControlls);
#endif
                }
                
            }
            
        }
        else
        {
#ifndef DEBUG
            NSAssert(vController, @"你传入的 ViewController 字符串有问题，%@ 类名不正确",sClassName);
#endif
        }
        
    }];
}

- (void)setIPage:(NSInteger)iPage
{
    _iPage = iPage;
    self.selectedIndex = _iPage;
}


@end
