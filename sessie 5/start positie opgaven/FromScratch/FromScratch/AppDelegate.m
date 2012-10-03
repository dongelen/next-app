//
//  AppDelegate.m
//  FromScratch
//
//  Created by Raymond Van Dongelen on 10/3/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "AppDelegate.h"
#import "RoodScherm.h"
#import "BlauwScherm.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    RoodScherm * roodScherm = [[RoodScherm alloc] initWithNibName:nil bundle:nil];
    BlauwScherm * blauwScherm = [[BlauwScherm alloc] initWithNibName:nil bundle:nil];

    UITabBarController * tabbarController = [[UITabBarController alloc] init];
    [tabbarController setViewControllers:@[roodScherm, blauwScherm]];
    
    
//    [self.window setRootViewController:roodScherm];
    [self.window setRootViewController:tabbarController];

    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
