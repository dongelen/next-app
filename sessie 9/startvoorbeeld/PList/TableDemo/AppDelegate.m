//
//  AppDelegate.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "AppDelegate.h"
#import "BoekListViewController.h"
#import "BoekStore.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    [[BoekStore sharedBooks] load];
    
    BoekListViewController * booklist = [[BoekListViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:booklist];
    
    [self.window setRootViewController:navController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
