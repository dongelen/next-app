//
//  BookDemostratieTests.m
//  BookDemostratieTests
//
//  Created by Raymond Van Dongelen on 9/27/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BookDemostratieTests.h"
#import "Boek.h"
@implementation BookDemostratieTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testBook
{
    
    Boek * boek = [[Boek alloc]init];
    boek.titel = @"Big nerd ranch";
    boek.auteur =@"Joe";

    Boek * nogEenBoek = [[Boek alloc]init];
    nogEenBoek.titel = @"Bla";
    nogEenBoek.auteur = @"BlaBla";
    
    
    [boek setAuteur:@"Joe"];
    
    NSLog (@"Auteur heet %@", boek.auteur);
    NSLog(@"Auteur heet %@", [boek auteur]);
    
    [boek logBoek];
    
    
    
    
    
}















@end
