//
//  Books.m
//  BookShop
//
//  Created by Raymond Van Dongelen on 9/17/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "Books.h"

@implementation Books

// Init
- (id)init
{
    self = [super init];
    if (self) {
        bookList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addBook:(Book *) book
{
    [bookList addObject:book];
}


- (NSUInteger) count
{
    return [bookList count];
}
@end











