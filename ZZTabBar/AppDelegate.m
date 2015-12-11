//
//  AppDelegate.m
//  ZZTabBar
//
//  Created by farben on 15/12/8.
//  Copyright © 2015年 ZZning. All rights reserved.
//

#import "AppDelegate.h"
#import "ZZTabBar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    NSArray *arrItem = @[@[@"新闻", @"Cancel_Home",     @"Select_Home"],
                         @[@"报表", @"Cancel_Stats",    @"Select_Stats"],
                         @[@"我的", @"Cancel_Profile",  @"Select_Profile"],
                         @[@"设置", @"Cancel_Settings", @"Select_Settings"]];
    
    
    NSArray *array = @[@"OneController",
                       @"twoController",
                       @"ThreeController",
                       @"FourController"];
    
    ZZTabBar *tabBar = [ZZTabBar sharedInstance:@"UINavigationController" arrayController:array];
    [tabBar installItemImageAndTitle:arrItem TitleCancelColor:[UIColor blackColor] TitleSelectColor:[UIColor redColor] TitleFont:12];
    tabBar.iPage = 0;
    
    self.window.rootViewController = tabBar;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

    
}

- (void)applicationWillTerminate:(UIApplication *)application {

    
}


@end
