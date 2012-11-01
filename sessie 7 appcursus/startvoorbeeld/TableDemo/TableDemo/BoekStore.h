//
//  BookStore.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@interface BookStore : NSObject
{
    NSMutableArray * books;
}


- (void)addBook:(Book*)book;
- (NSArray *) allBooks;

+ (BookStore *) sharedBooks;

// [[BookStore sharedBooks] allBooks]
@end
