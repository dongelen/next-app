//
//  BookStore.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/9/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookStore : NSObject
{
    NSArray * allBooks;
}


- (NSArray*)  books;
+ (BookStore*) sharedStore;
@end
