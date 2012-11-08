//
//  Boek.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 11/8/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Boek : NSManagedObject

@property (nonatomic, retain) NSString * titel;
@property (nonatomic, retain) NSString * auteur;

@end
