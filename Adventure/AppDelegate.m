//
//  AppDelegate.m
//  Adventure
//
//  Created by admin on 2020/7/6.
//  Copyright © 2020 adv. All rights reserved.
//

#import "AppDelegate.h"
#import "TreasureViewController.h"
#import "ProfessionSelectViewController.h"
#import "MainTitleViewController.h"
#import "CommonNavigationController.h"
#import "PathViewController.h"
#import "EventViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    PathViewController * bvc = [[PathViewController alloc]initWithNibName:@"PathViewController" bundle:nil];
    CommonNavigationController * navi = [[CommonNavigationController alloc]initWithRootViewController:bvc];

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    
    
    // Override point for customization after application launch.
    return YES;
}




@end
