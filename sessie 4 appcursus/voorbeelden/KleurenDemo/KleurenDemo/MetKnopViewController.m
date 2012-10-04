//
//  MetKnopViewController.m
//  KleurenDemo
//
//  Created by Raymond Van Dongelen on 10/4/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "MetKnopViewController.h"

@interface MetKnopViewController ()

@end

@implementation MetKnopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        badgeNummer = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doeIets:(id)sender {
    NSLog (@"Hier wordt straks iets leuks gedaan");
    badgeNummer ++;
    NSString * badgeAlsString = [[NSNumber numberWithInt:badgeNummer] stringValue];
    
    [self.tabBarItem setBadgeValue:badgeAlsString];
}


@end

