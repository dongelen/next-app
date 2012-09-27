//
//  Boek.m
//  BookDemostratie
//
//  Created by Raymond Van Dongelen on 9/27/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "Boek.h"

@implementation Boek
- (void) logBoek
{
    NSLog (@"Dit is het boek met titel %@", self.titel);
    NSLog (@"En auteur %@", self.auteur);
    
}

@end
