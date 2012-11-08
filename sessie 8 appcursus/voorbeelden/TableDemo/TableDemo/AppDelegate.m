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
    // Init core data

    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"test.sqlite"];
    
    
    // Init window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


    
    NSLog (@"&&&&&&&& Titel = %@", [[Boek findAll][0] titel]);
    Boek * b = [Boek createEntity];
    b.titel = @"Jip & Janneke";
    b.auteur = @"Annie";
    [[NSManagedObjectContext defaultContext] save];

    return YES;
}

@end
