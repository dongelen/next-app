//
//  Book.m
//  BookShop
//
//  Created by Raymond Van Dongelen on 9/17/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "Boek.h"

@implementation Boek

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if( self != nil )
    {
        NSLog (@"Decoding");
        self.title = [decoder decodeObjectForKey:@"title"];
        self.author = [decoder decodeObjectForKey:@"author"];
    }
    return self;
}


- (id)initBookWithAuthor:(NSString*)author andTitle:(NSString*)title
{
    self = [self init];
    if (self) {
        self.author =author;
        self.title = title;
    }
    return self;
}

+ (id)boekWithAuthor:(NSString *)author andTitle:(NSString *) title
{
    return [[Boek alloc] initBookWithAuthor:author
                                   andTitle:title];
}



- (void) showDetailsInLog
{
    NSLog (@"Dit is het boek van %@ met titel %@", self.author, self.title);
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    NSLog (@"Encoding");
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.author forKey:@"author"];    
}


@end
