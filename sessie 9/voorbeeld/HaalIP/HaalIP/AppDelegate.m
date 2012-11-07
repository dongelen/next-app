//
//  AppDelegate.m
//  HaalIP
//
//  Created by Raymond Van Dongelen on 11/7/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "AFNetworking.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Plaats voor onze netwerk code
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://httpbin.org/ip"]];
    
    AFJSONRequestOperation * operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {

        NSLog (@"De json %@", JSON);
        NSLog (@"Ip adres %@", [JSON valueForKey:@"origin"]);

    } failure:nil];
    
    [operation start];
    
    //
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}
@end
