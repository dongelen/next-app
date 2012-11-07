//
//  Book.m
//  BookShop
//
//  Created by Raymond Van Dongelen on 9/17/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "Boek.h"

@implementation Boek

- (id)initBookWithAuthor:(NSString*)author andTitle:(NSString*)title
{
    self = [self init];
    if (self) {
        self.author =author;
        self.title = title;
    }
    return self;
}

- (id)initWithJSONObject:(id)jsonObject
{
    return [self initBookWithAuthor:[jsonObject valueForKey:@"author"] andTitle:[jsonObject valueForKey:@"title"]];
}

+ (id)bookWithAuthor:(NSString *)author andTitle:(NSString *) title
{
    return [[Boek alloc] initBookWithAuthor:author
                                   andTitle:title];
}
+ (id) bookWithJSONObject:(id)jsonObject
{
    return [[Boek alloc] initWithJSONObject:jsonObject ];
    
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"Dit is het boek van %@ met titel %@", self.author, self.title];
}



@end
