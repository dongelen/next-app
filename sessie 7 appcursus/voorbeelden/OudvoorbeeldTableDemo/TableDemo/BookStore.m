//
//  BookStore.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BookStore.h"

@implementation BookStore

- (id)init
{
    self = [super init];
    if (self) {
        Book * book1 = [Book bookWithAuthor:@"Annie MG Schmidt" andTitle:@"Jip en Janneke"];
        books = [[NSMutableArray alloc] init];
        [self addBook:book1];
        
//        books = @[@"Big nerd ranch", @"Jip & Janneke", @"Punished by rewards"];
    
    }
    return self;
}

- (NSArray *) allBooks{
    return books;
}

- (void)addBook:(Book*)book
{
    [books addObject:book];
}


#pragma mark Singleton spul
+ (BookStore *) sharedBooks
{
    static BookStore * sharedBooks = nil;
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

