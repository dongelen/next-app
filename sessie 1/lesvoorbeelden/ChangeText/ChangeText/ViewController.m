//
//  ViewController.m
//  ChangeText
//
//  Created by Raymond Van Dongelen on 9/12/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize melding;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMelding:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)doeIets:(id)sender{
    NSLog (@"Bla");
    [melding setText:@"Dit is een tekst"];
    
}

@end
