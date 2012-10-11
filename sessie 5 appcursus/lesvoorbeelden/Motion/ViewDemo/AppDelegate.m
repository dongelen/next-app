//
//  AppDelegate.m
//  ViewDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    DemoViewController * demo = [[DemoViewController alloc]initWithNibName:nil bundle:nil];
    
    [self.window setRootViewController:demo];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
