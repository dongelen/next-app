//
//  Book.h
//  BookShop
//
//  Created by Raymond Van Dongelen on 9/17/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic) NSString * author;
@property (nonatomic) NSString * title;


- (void) showDetailsInLog;

- (id)initBookWithAuthor:(NSString*)author andTitle:(NSString*)title;


+ (id)bookWithAuthor:(NSString *)author andTitle:(NSString *) title;


// function initWithAuthorAndTitle (author:String, title:String)
@end
