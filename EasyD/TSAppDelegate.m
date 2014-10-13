//
//  TSAppDelegate.m
//  EasyD
//
//  Created by Aries on 14-9-24.
//  Copyright (c) 2014年 TechSailor. All rights reserved.
//

#import "TSAppDelegate.h"
#import "TSMainViewController.h"
#import "TSFlashViewController.h"

@implementation TSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    NSLog(@"初始：%d",[[NSUserDefaults standardUserDefaults] boolForKey:@"firsRun"]);
    if ([self isFirstRun]){
        NSLog(@"进入闪屏");
        TSFlashViewController *flashVC = [[TSFlashViewController alloc] init];
        self.window.rootViewController = flashVC;

    }else{
        NSLog(@"进入主页");
        TSMainViewController *mainVC = [[TSMainViewController alloc] init];
        UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:mainVC];
        self.window.rootViewController = naviController;
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
- (BOOL)isFirstRun
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    BOOL  hasRunBefore = [defaults boolForKey:@"firsRun"];
    if(!hasRunBefore){
        NSLog(@"这是第一次运行");
        [defaults setBool:YES forKey:@"firsRun"];
        return YES;
    } 
    return NO;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
