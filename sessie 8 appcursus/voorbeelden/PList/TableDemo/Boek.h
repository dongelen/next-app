//
//  Book.h
//  BookShop
//
//  Created by Raymond Van Dongelen on 9/17/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Boek : NSObject

- (void) showDetailsInLog;
- (id)initBookWithAuthor:(NSString*)author andTitle:(NSString*)title;

+ (id)boekWithAuthor:(NSString *)author andTitle:(NSString *) title;

// Boek * b = [Boek boekWithAuthor:@"Raymond" andTitle:@"My life"];
// Boek * b = [[Boek alloc] initWithAuthor:@"Raymond" andTitle:@"My life"]];

@property (nonatomic) NSString * author;
@property (nonatomic) NSString * title;



@end
