//
//  AllebBoekenViewController.m
//  FromScratch
//
//  Created by Raymond Van Dongelen on 10/1/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "AllebBoekenViewController.h"

@interface AllebBoekenViewController ()

@end

@implementation AllebBoekenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor purpleColor]];
        UITabBarItem * tbi = [self tabBarItem];
        [tbi setBadgeValue:@"2"];
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
