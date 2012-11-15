//
//  Book.h
//  BookShop
//
//  Created by Raymond Van Dongelen on 9/17/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Boek : NSObject

- (id)initBookWithAuthor:(NSString*)author andTitle:(NSString*)title;
- (id)initWithJSONObject:(id)jsonObject;

+ (id)bookWithAuthor:(NSString *)author andTitle:(NSString *) title;
+ (id) bookWithJSONObject:(id)jsonObject;
@property (nonatomic) NSString * author;
@property (nonatomic) NSString * title;



@end
