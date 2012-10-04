//
//  AppDelegate.m
//  KleurenDemo
//
//  Created by Raymond Van Dongelen on 10/4/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "AppDelegate.h"
#import "KleurSchermViewController.h"
#import "MetKnopViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    KleurSchermViewController * scherm =  [[KleurSchermViewController alloc] initWithNibName:nil bundle:nil];

    KleurSchermViewController * scherm2 =  [[KleurSchermViewController alloc] initWithNibName:nil bundle:nil];
    
    
    MetKnopViewController * metKnop = [[MetKnopViewController alloc ] initWithNibName:@"MetKnopViewController" bundle:nil];
    
    UITabBarController * tabBar = [[UITabBarController alloc] init];
    [tabBar setViewControllers:@[scherm, scherm2, metKnop]];
    
    [scherm setKleur:[UIColor yellowColor]];
    [scherm2 setKleur:[UIColor magentaColor]];
    
    [self.window setRootViewController:tabBar];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
