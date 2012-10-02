//
//  NieuwBoekViewController.m
//  FromScratch
//
//  Created by Raymond Van Dongelen on 10/1/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "NieuwBoekViewController.h"

@interface NieuwBoekViewController ()
- (void) addScreenElements;
@end

@implementation NieuwBoekViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self addScreenElements];
    }
    return self;
}

- (void) addScreenElements
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0,100.0)];

    [label setText:@"Het eerste scherm!"];
    
    [self.view addSubview:label];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
