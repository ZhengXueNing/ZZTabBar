//
//  OneController.m
//  ZZTabBar
//
//  Created by farben on 15/12/8.
//  Copyright © 2015年 ZZning. All rights reserved.
//

#import "OneController.h"
#import "ZZTabBar.h"
#import "OtherController.h"

@interface OneController ()


@end

@implementation OneController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    NSArray *arrData = @[@"为新闻添加\n一个『10』标签",
                         @"为报表添加\n一个『-10』标签",
                         @"为我的添加\n一个『120』标签",
                         @"修改新闻标签\n为『21』标签",
                         @"修改报表标签\n为『45』标签",
                         @"将新闻标签\n删除",
                         @"将所有标签\n清除"];
    
    
    for (NSInteger i = 0; i < arrData.count; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i + 1;
        button.frame = CGRectMake(30, 64 + (50 * i), 200, 40);
        [button addTarget:self action:@selector(buttonNumber:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:arrData[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor grayColor]];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        button.titleLabel.numberOfLines = 0;
        [self.view addSubview:button];
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 64 + 350, 50, 50);
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)buttonNumber:(UIButton *)btn
{
    ZZTabBar *tabar = [ZZTabBar sharedInstance];
    
    switch (btn.tag) {
        case 1:
            [tabar addRedDot:0 dotNumber:10];
            break;
        case 2:
            [tabar addRedDot:1 dotNumber:-10];
            break;
        case 3:
            [tabar addRedDot:2 dotNumber:120];
            break;
        case 4:
            [tabar addRedDot:0 dotNumber:21];
            break;
        case 5:
            [tabar addRedDot:1 dotNumber:45];
            break;
        case 6:
            [tabar removeRedDot:0];
            break;
        default:
            [tabar removeAllRedDot];
            break;
    }
}

- (void)btnPush
{
    OtherController *otherController = [[OtherController alloc] init];
    otherController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:otherController animated:YES];
}


@end
