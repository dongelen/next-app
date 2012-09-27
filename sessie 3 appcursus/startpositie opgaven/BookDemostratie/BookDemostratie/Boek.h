//
//  Boek.h
//  BookDemostratie
//
//  Created by Raymond Van Dongelen on 9/27/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Boek : NSObject
@property (nonatomic) NSString * titel;
@property (nonatomic) NSString * auteur;
// boek.auteur
// [boek setAuteur:@"Bla"]
// [boek auteur]  <-- boek.getAuteur()

- (void) logBoek;
@end
