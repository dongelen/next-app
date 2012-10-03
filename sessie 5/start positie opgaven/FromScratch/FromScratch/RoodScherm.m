//
//  RoodScherm.m
//  FromScratch
//
//  Created by Raymond Van Dongelen on 10/3/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "RoodScherm.h"

@interface RoodScherm ()

@end

@implementation RoodScherm

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
