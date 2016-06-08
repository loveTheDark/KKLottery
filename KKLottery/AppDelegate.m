//
//  AppDelegate.m
//  KKLottery
//
//  Created by 余伟康 on 16/6/8.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "AppDelegate.h"
#import "KKTabBarController.h"
#import "KKGuideViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    // 设置根控制器
    if ([self isNewVersion]) {
        
        // 新特性
        self.window.rootViewController = [[KKGuideViewController alloc]init];
        
    }else{
        
        // 主程序
        self.window.rootViewController = [[KKTabBarController alloc]init];
    }
    
    [self.window makeKeyAndVisible];
    
    // 状态栏设置
    application.statusBarStyle = UIStatusBarStyleLightContent;
    application.statusBarHidden = NO;
    
    return YES;
}

#pragma mark
#pragma mark - 新特性逻辑
- (BOOL)isNewVersion{

    // 获取当前版本
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = info[@"CFBundleShortVersionString"];
    
    // 获取之前存储的版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *oldVersion = [defaults objectForKey:@"app_version"];
    
    // 比较
    if ([currentVersion isEqualToString:oldVersion]) {
        return NO;
    }else{
    
        [defaults setObject:currentVersion forKey:@"app_version"];
        [defaults synchronize];
        
        return YES;
    }
}

@end
