//
//  BookStore.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BoekStore.h"

@implementation BoekStore

- (id)init
{
    self = [super init];
    if (self) {
        boeken = [[NSMutableArray alloc]init];

        // Standaard vulling
        Boek * boek1 = [Boek boekWithAuthor:@"Kevin Kelly" andTitle:@"What technology wants"];
        Boek * boek2 = [Boek boekWithAuthor:@"Joey Conway & Aaron Hillgass" andTitle:@"iOs Programming"];
        
        [boeken addObject:boek1];
        [boeken addObject:boek2];
    }
    return self;
}

- (NSArray *) allBooks{
    return boeken;
}

- (void) voegBoekToe:(Boek*) boek
{
    [boeken addObject:boek];
}

#pragma mark Singleton spul
+ (BoekStore *) sharedBooks
{
    static BoekStore * sharedBooks = nil;
    if (!sharedBooks){
        sharedBooks = [[super allocWithZone:nil] init];
    }
    return sharedBooks;
}

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedBooks];
}





@end

