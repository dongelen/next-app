//
//  AppDelegate.m
//  GroceryProto
//
//  Created by Martin Walvius on 10/10/12.
//  Copyright (c) 2012 Martin Walvius. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <Parse/Parse.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@""
                  clientKey:@""];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
    [nc1.navigationBar setTintColor:[UIColor blackColor]];
    [nc1.navigationBar setTranslucent:NO];
  
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
     UIRemoteNotificationTypeAlert|
     UIRemoteNotificationTypeSound];

    [self.window setRootViewController:nc1];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken
{
    [PFPush storeDeviceToken:newDeviceToken];
    [PFPush subscribeToChannelInBackground:@""];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}


@end
