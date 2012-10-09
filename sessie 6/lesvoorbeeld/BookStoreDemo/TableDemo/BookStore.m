//
//  BookStore.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/9/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BookStore.h"

@implementation BookStore

-(id) init
{
    self = [super init];
    if (self){
        allBooks =@[@"Big nerd ranch", @"Tropical truth", @"Punished by rewards"];
    }
    return self;
}

- (NSArray*)  books
{
    return allBooks;
}


+ (BookStore*) sharedStore
{
    static BookStore * sharedStore = nil;
    if (!sharedStore){
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}
@end
