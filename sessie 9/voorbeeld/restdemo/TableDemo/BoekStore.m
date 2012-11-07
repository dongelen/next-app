//
//  BookStore.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BoekStore.h"
#import "AFNetworking.h"
#import <RestKit/RestKit.h>

@implementation BoekStore

- (id)init
{
    self = [super init];
    if (self) {
        boeken = [[NSMutableArray alloc] init];
        RKObjectManager* manager = [RKObjectManager objectManagerWithBaseURLString:@"http://still-brook-6654.herokuapp.com/"];
        
        [manager.router routeClass:[Boek class] toResourcePath:@"/books"];
        
    }
    return self;
}

- (NSArray *) allBooks{
    return boeken;
}

- (void) load
{
    NSURL *url = [NSURL URLWithString:@"http://still-brook-6654.herokuapp.com/books.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSLog (@"Daar komt de json %@", JSON[0]);
        NSLog (@"Aantal boeken %d", [JSON count]);

        for (id boek in JSON)
        {
            [self voegBoekToe:[Boek bookWithJSONObject:boek]];
        }
        
        NSLog (@"Array is gevuld %@", boeken);
    
    } failure:nil];
    
    [operation start];
}

- (void) voegBoekToe:(Boek*) boek
{
    [boeken addObject:boek];
    [self boeksChangedBlock](boek);
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

