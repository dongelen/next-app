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
@synthesize urlbar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setWebview:nil];
    [self setUrlbar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)goButton:(id)sender {
    NSURL * url = [NSURL URLWithString:[urlbar text]];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    
    [webview loadRequest:req];
    [urlbar resignFirstResponder];
}
@end
