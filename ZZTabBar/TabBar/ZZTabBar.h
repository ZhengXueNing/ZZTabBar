//
//  CustomTabBarViewController.h
//  TabBarDome
//
//  Created by farben on 15/7/21.
//  Copyright (c) 2015年 ZZning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZTabBar : UITabBarController

/**
 *  (主动)界面转化
 */
@property (nonatomic, assign) NSInteger         iPage;

/**
 *  获取内存地址
 */
+ (id)sharedInstance;

/**
 *  构造单例模式
 *
 *  @param sNavigationControlls 传入自定义NavigationControlls类名
 *  @param arrayController      传入TabBar 控制层的类名
 *
 *  @discussion 传入的数组必须严格遵守格式如以下例子
 *
 *  Example:
 *
 *  传入自定义NavigationControlls类名
 *
 *  @discussion
 *  假如你使用的Controller 不需要 UINavigationControll 那么请忽略这个参数
 *  假如你使用的是系统原生态的 UINavigationControll 那么 你需要传入 @"UINavigationController"
 *  假如你使用的是自定义的 UINavigationControll 那么需要将你定制的 UINavigationControll 类名以字符串形式传入
 *
 *  传入TabBar 控制层的类名
 *
 *  @discussion
 *
 *  Example:
 *  self.arrayControlls = @[@"控制类名1", @"控制类名2", @"控制类名3", @"控制类名4"];
 *
 *  @return 本身
 */
+ (instancetype)sharedInstance:(NSString *)sNavigationControlls
               arrayController:(NSArray  *)arrayController;


/**
 *  设置TabBar的Item图片、文字
 *
 *  @discussion 传入的数组必须严格遵守格式如以下例子
 *
 *  Example:
 *
 *  NSArray *_itemDataArr = @[@[@"Item文字1", @"Item未选图片1", @"Item已选图片1"],
 *                            @[@"Item文字2", @"Item未选图片2", @"Item已选图片1"],
 *                            @[@"Item文字3", @"Item未选图片3", @"Item已选图片1""],
 *                            @[@"Item文字4", @"Item未选图片4", @"Item已选图片1"];
 *
 *  @param arrayImgAndTitle 传入一个二维数组
 */
- (void)installItemImageAndTitle:(NSArray *)arrayImgAndTitle;

/**
 *  设置TabBar的Item图片、文字，及TabBar的背景图
 *
 *  @discussion 传入的数组必须严格遵守格式如以下例子
 *
 *  Example:
 *
 *  NSArray *_itemDataArr = @[@[@"Item文字1", @"Item未选图片1", @"Item已选图片1"],
 *                            @[@"Item文字2", @"Item未选图片2", @"Item已选图片1"],
 *                            @[@"Item文字3", @"Item未选图片3", @"Item已选图片1""],
 *                            @[@"Item文字4", @"Item未选图片4", @"Item已选图片1"];
 *
 *  @param arrayImgAndTitle 传入一个二维数组
 *  @param sBackGround      背景图片的名字 可为nil
 */
- (void)installItemImageAndTitle:(NSArray *)arrayImgAndTitle
                 BackgroundImage:(NSString *)sBackGround;

/**
 *  设置TabBar的Item图片、文字，及修改字体颜色及字体大小
 *
 *  @discussion 传入的数组必须严格遵守格式如以下例子
 *
 *  Example:
 *
 *  NSArray *_itemDataArr = @[@[@"Item文字1", @"Item未选图片1", @"Item已选图片1"],
 *                            @[@"Item文字2", @"Item未选图片2", @"Item已选图片1"],
 *                            @[@"Item文字3", @"Item未选图片3", @"Item已选图片1""],
 *                            @[@"Item文字4", @"Item未选图片4", @"Item已选图片1"];
 *
 *  @param arrayImgAndTitle 传入一个二维数组
 *  @param textCancelColor  未选中字体颜色 可为nil
 *  @param textSelectColor  已选中字体颜色 可为nil
 *  @param iFont            传入字体大小 @"0"时为默认大小
 */
- (void)installItemImageAndTitle:(NSArray  *)arrayImgAndTitle
                TitleCancelColor:(UIColor  *)textCancelColor
                TitleSelectColor:(UIColor  *)textSelectColor
                       TitleFont:(NSInteger )iFont;


/**
 *  设置TabBar的Item图片、文字及TabBar的Background
 *
 *  @discussion 传入的数组必须严格遵守格式如以下例子
 *
 *  Example:
 *
 *  NSArray *_itemDataArr = @[@[@"Item文字1", @"Item未选图片1", @"Item已选图片1"],
 *                            @[@"Item文字2", @"Item未选图片2", @"Item已选图片1"],
 *                            @[@"Item文字3", @"Item未选图片3", @"Item已选图片1""],
 *                            @[@"Item文字4", @"Item未选图片4", @"Item已选图片1"];
 *
 *  @param arrayImgAndTitle      传入一个二维数组
 *  @param sBackGround           背景图片的名字 可为nil
 *  @param textCancelColor       未选中字体颜色 可为nil
 *  @param textSelectColor       已选中字体颜色 可为nil
 *  @param iFont                 传入字体大小 @"0"时为默认大小
 *
 */
- (void)installItemImageAndTitle:(NSArray  *)arrayImgAndTitle
                 BackgroundImage:(NSString *)sBackGround
                TitleCancelColor:(UIColor  *)textCancelColor
                TitleSelectColor:(UIColor  *)textSelectColor
                       TitleFont:(NSInteger )iFont;


/**
 *  添加Item红点
 *
 *  @param iControllerType 对应的 ViewController 下标
 *  @param iNumber         想要显示的数字
 */
- (void)addRedDot:(NSInteger)iControllerType dotNumber:(NSInteger)iNumber;

/**
 *  删除对应Item的红点
 *
 *  @param iControllerType 对应的 ViewController 下标
 */
- (void)removeRedDot:(NSInteger)iControllerType;

/**
 *  删除所有的Item红点
 */
- (void)removeAllRedDot;


@end
