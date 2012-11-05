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
        NSData * data = [NSData dataWithContentsOfFile:[self fileName]];
        NSArray *array =[NSKeyedUnarchiver unarchiveObjectWithData: data];
        
        boeken = [[NSMutableArray alloc]initWithArray:array ];

    }
    return self;
}

- (NSString *)fileName
{
    // Standaard map
    NSArray * paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    
   return [paths[0] stringByAppendingPathComponent:@"boeken.plist"];    
}

- (NSArray *) allBooks{
    return boeken;
}

- (void) voegBoekToe:(Boek*) boek
{
    [boeken addObject:boek];
    NSData *encodedBoeken = [NSKeyedArchiver archivedDataWithRootObject:boeken];
 
    [encodedBoeken writeToFile:[self fileName] atomically:YES];

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

