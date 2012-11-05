//
//  AppDelegate.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "AppDelegate.h"
#import "Boek.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"boeks.sqlite"];
    
    NSLog(@"Het aantal boeken is %d", [Boek countOfEntities]);
    
    Boek * boek = [Boek createEntity];
    boek.titel = @"Hallo";
    boek.auteur = @"Hoi";
    
    [[NSManagedObjectContext defaultContext] save];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
