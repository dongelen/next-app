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
    UITabBarItem * tbi = [self tabBarItem];
    UIImage * icon = [UIImage imageNamed:@"06-magnify"];
    [tbi setImage:icon];

    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0,100.0)];
    
    [label setText:@"Het eerste scherm!"];
    [self.view addSubview:label];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(10.0, 100.0, 200.0, 200.0)];
    [button setTitle:@"Klik mij niet!" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}

- (void) buttonClicked:(id)sender
{
    NSLog (@"Button clicked");
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
