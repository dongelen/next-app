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
        NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];

        NSData *myDecodedObject = [userDefault objectForKey:@"Boeken"];
        NSArray *array =[NSKeyedUnarchiver unarchiveObjectWithData: myDecodedObject];

        boeken = [[NSMutableArray alloc]initWithArray:array ];
    }
    return self;
}

- (NSArray *) allBooks{
    return boeken;
}

- (void) voegBoekToe:(Boek*) boek
{
    [boeken addObject:boek];
    NSData *encodedBoeken = [NSKeyedArchiver archivedDataWithRootObject:boeken];
 
    [[NSUserDefaults standardUserDefaults] setObject:encodedBoeken forKey:@"Boeken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
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

