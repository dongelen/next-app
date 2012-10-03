//
//  BlauwScherm.m
//  FromScratch
//
//  Created by Raymond Van Dongelen on 10/3/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BlauwScherm.h"

@interface BlauwScherm ()

@end

@implementation BlauwScherm

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self drawScreen];        
    }
    return self;
}

- (void) drawScreen
{
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    UITabBarItem * barItem = [self tabBarItem];
    [barItem setTitle:@"So blue"];
    
    UIImage * icon = [UIImage imageNamed:@"13-target"];
    [barItem setImage:icon];    
}















@end
