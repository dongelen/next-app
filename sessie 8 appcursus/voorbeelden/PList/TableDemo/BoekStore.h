//
//  BookStore.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boek.h"

@interface BoekStore : NSObject
{
    NSMutableArray * boeken;
}

- (NSArray *) allBooks;
- (void) voegBoekToe:(Boek*) boek;

+ (BoekStore *) sharedBooks;

@end
