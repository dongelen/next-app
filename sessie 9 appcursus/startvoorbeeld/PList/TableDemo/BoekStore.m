//
//  BookStore.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BoekStore.h"
#import "AFNetworking.h"
@implementation BoekStore

- (id)init
{
    self = [super init];
    if (self) {
        
        boeken = [[NSMutableArray alloc]init];

    }
    return self;
}

- (void)load
{
    NSURLRequest * request = [NSURLRequest requestWithURL:
                              [NSURL URLWithString:@"http://still-brook-6654.herokuapp.com/books.json"]];
    
    AFJSONRequestOperation * operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSLog (@"De boeken zijn binnengekomen %@", JSON);

        // Loop over alle boeken
        for (id boekJSON in JSON)
        {
            // Voeg boek toe vanuit JSON aan de array
            [self voegBoekToe:[Boek boekWithJSON:boekJSON]];
        }
        
        NSLog (@"Klopt de array ? %@", boeken);
        
        // Verstuur notificatie
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BoekStoreChanged" object:self];
        
    } failure:nil];
    
    [operation start];
    
}



- (NSString *)fileName
{
    // Standaard map
    NSArray * paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSLog (@"Pad naam %@", paths);
   return [paths[0] stringByAppendingPathComponent:@"boeken.plist"];    
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

