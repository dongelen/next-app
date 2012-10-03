//
//  AppDelegate.m
//  FromScratch
//
//  Created by Raymond Van Dongelen on 10/1/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "AppDelegate.h"
#import "NieuwBoekViewController.h"
#import "AllebBoekenViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    UITabBarController *tabs = [[UITabBarController alloc] init];
    

    NieuwBoekViewController * nieuwBoek = [[NieuwBoekViewController alloc] initWithNibName:nil bundle:nil];
    
    AllebBoekenViewController * boeken =[[AllebBoekenViewController alloc] initWithNibName:nil bundle:nil];
    
    
    [tabs setViewControllers:@[nieuwBoek, boeken]];
//    self.window.rootViewController = nieuwBoek;
    self.window.rootViewController = tabs;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
