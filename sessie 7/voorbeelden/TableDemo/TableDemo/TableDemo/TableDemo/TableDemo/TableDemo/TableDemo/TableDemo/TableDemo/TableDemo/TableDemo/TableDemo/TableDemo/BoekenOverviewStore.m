//
//  BoekenOverviewStore.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/18/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BoekenOverviewStore.h"
#import "Book.h"

@implementation BoekenOverviewStore

- (id)init
{
    self = [super init];
    if (self) {
        Book * b = [Book bookWithAuthor:@"Annie MG Smidt" andTitle:@"Jip en Janneke"];
        boeken = @[b];
    }
    return self;
}

- (NSArray *) alleBoeken
{
    return boeken;
}

+ (BoekenOverviewStore *) sharedBoekenOverviewStore
{
    static BoekenOverviewStore* sharedBookStore = nil;
    if (!sharedBookStore){
        sharedBookStore = [[super allocWithZone:nil] init];
    }
    return sharedBookStore;
}
+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedBoekenOverviewStore];
}


@end


