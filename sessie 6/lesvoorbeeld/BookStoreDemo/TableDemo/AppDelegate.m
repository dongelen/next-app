//
//  AppDelegate.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/9/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "AppDelegate.h"
#import "BookListViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    BookListViewController *bookListViewController = [[BookListViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    [self.window setRootViewController:bookListViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
