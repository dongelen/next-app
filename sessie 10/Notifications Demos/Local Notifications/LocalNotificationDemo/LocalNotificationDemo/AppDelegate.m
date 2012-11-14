//
//  AppDelegate.m
//  LocalNotificationDemo
//
//  Created by Erik van der Wal on 13-11-12.
//  Copyright (c) 2012 Erik van der Wal. All rights reserved.
//

#import "AppDelegate.h"
#import "NotificationViewController.h"
#import "YRDropdownView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Kijk of er er een notificatie object in launchOptions zit. Als dit zo is,
    // wordt die afgehandeld met handleNotificationFromInactiveState:
    UILocalNotification *notification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (notification) {
        [self handleNotificationFromInactiveState:notification];
    }
    
    // Init view controller
    NotificationViewController *controller = [[NotificationViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    [self.window setRootViewController:navController];
    return YES;
}

- (void)clearBadgeNumberAndNotificationCenter
{
    // Om een notificatie uit notification center te halen, moet je de badge nummer
    // eerst een waarde geven en daarna zero-en.
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:1];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)handleNotificationFromInactiveState:(UILocalNotification *)notification
{
    // Wanneer een gebruiker de app opstart via de notificatie, wordt deze
    // methode aangeroepen. In dit geval tonen we een 2e alert, maar je zou ook
    // een viewcontroller kunnen pushen
    [self alertWithText:@"Opened via notification"];
    [self clearBadgeNumberAndNotificationCenter];
}

- (void)handleNotificationFromActiveState:(UILocalNotification *)notification
{
    // Wanneer de app op de voorgrond draait, ziet de gebruiker de notificatie
    // niet. Het is aan jou om te bepalen wat er moet gebeuren. In dit geval tonen
    // we de notificatie alsnog (middels een 3rd party library), maar je zou ook
    // enkel een tableview kunnen refreshen of een nieuwe viewcontroller kunnen tonen.
    [YRDropdownView showDropdownInView:self.window
                                 title:@"Notification"
                                detail:notification.alertBody
                              animated:YES];
    
    [self clearBadgeNumberAndNotificationCenter];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{    
    UIApplicationState state = [application applicationState];
    
    switch (state) {
        case UIApplicationStateActive:
            [self handleNotificationFromActiveState:notification]; // app draait al op de voorgrond
            break;
            
        case UIApplicationStateInactive:
            [self handleNotificationFromInactiveState:notification]; // app komt vanuit de achtergrond
            
        default:
            break;
    }
}

#pragma mark - UIAlert Conveniance Methods

- (void)alertWithText:(NSString *)text
{
    [self alertWithText:text title:nil];
}

- (void)alertWithText:(NSString *)text title:(NSString *)title
{
    title = ([title length] > 0 ? title : @"Notification");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:text
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    [alert show];
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
