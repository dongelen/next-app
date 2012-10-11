//
//  DemoViewController.m
//  ViewDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "DemoViewController.h"
@interface DemoViewController ()

@end

@implementation DemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self tekenScherm];
    }
    return self;
}

- (void) tekenScherm
{
    
    view1 = [[RodeView alloc] initWithFrame:CGRectMake(10,10,20,20)];
    

    RodeView * view2 = [[RodeView alloc] initWithFrame:CGRectMake(10,100,100,20)];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10,300, 200,100)];
    
    
    [label setText:@"Hallo"];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        
    [button setFrame:CGRectMake(10, 400, 100, 100)];
    
    [button setTitle:@"Hallo" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:label];
    [self.view addSubview:button];
}

- (void) buttonPressedAction:(id)sender
{
    [UIView animateWithDuration:2 animations:^{
        [view1 setFrame:CGRectMake(400,400, 10,10)];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


@end
