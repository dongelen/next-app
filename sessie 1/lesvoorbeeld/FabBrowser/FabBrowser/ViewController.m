//
//  ViewController.m
//  FabBrowser
//
//  Created by Raymond Van Dongelen on 9/12/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webview;
@synthesize urlBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setUrlBar:nil];
    [self setWebview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)goButton:(id)sender {
    NSURL * url = [NSURL URLWithString:[urlBar text]];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    
    [webview loadRequest:req];
    [urlBar resignFirstResponder];
}
@end
