//
//  Books.h
//  BookShop
//
//  Created by Raymond Van Dongelen on 9/17/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "book.h"

@interface Books : NSObject
{
    NSMutableArray * bookList;
}
- (void) addBook:(Book *) book;
- (NSUInteger) count;

@end
