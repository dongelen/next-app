//
//  ViewController.m
//  SaveOneValue
//
//  Created by Raymond Van Dongelen on 11/4/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.value.text =[[NSUserDefaults standardUserDefaults] valueForKey:@"EenWaarde"];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setButton:(id)sender {
    [[NSUserDefaults standardUserDefaults] setValue:self.value.text forKey:@"EenWaarde"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
