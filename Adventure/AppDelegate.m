//
//  AppDelegate.m
//  Adventure
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 adv. All rights reserved.
//

#import "AppDelegate.h"
#import "BattleViewController.h"
#import "ProfessionSelectViewController.h"
#import "MainTitleViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MainTitleViewController * bvc = [[MainTitleViewController alloc]initWithNibName:@"MainTitleViewController" bundle:nil];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = bvc;
    [self.window makeKeyAndVisible];
    
    
    // Override point for customization after application launch.
    return YES;
}




@end
