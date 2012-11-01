//
//  BoekenOverviewStore.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/18/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boek.h"
@interface BoekenOverviewStore : NSObject
{
    NSMutableArray * boeken;
}

- (void) voegBoekToe:(Boek *) boek;
- (NSArray *) alleBoeken;
+ (BoekenOverviewStore *) sharedBoekenOverviewStore;
/*
 
 BoekOverviewStore * store = [BookOverviewStore sharedStore];

 NSArray * boeken = [store alleBoeken];
 
 
 */

@end
