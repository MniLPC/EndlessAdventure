//
//  AppDelegate.m
//  Adventure
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 adv. All rights reserved.
//

#import "AppDelegate.h"
#import "BattleViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BattleViewController * bvc = [[BattleViewController alloc]initWithNibName:@"BattleViewController" bundle:nil];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = bvc;
    [self.window makeKeyAndVisible];
    
    
    // Override point for customization after application launch.
    return YES;
}




@end
