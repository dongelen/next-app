//
//  Boek.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 11/5/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Boek : NSManagedObject

@property (nonatomic, retain) NSString * auteur;
@property (nonatomic, retain) NSString * titel;

@end
