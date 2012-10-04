//
//  RoodSchermViewController.m
//  KleurenDemo
//
//  Created by Raymond Van Dongelen on 10/4/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "KleurSchermViewController.h"

@interface KleurSchermViewController ()

@end

@implementation KleurSchermViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self.view setBackgroundColor:[UIColor redColor]];
        
        [self.tabBarItem setTitle:@"Hallo"];
        
        UIImage * icoon = [UIImage imageNamed:@"13-target"];
        [self.tabBarItem setImage:icoon];
    }
    return self;
}

- (void) setKleur:(UIColor*) kleur
{
    [self.view setBackgroundColor:kleur];
}

@end
