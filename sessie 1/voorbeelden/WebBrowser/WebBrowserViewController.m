//
//  WebBrowserViewController.m
//  WebBrowser
//
//  Created by Raymond van Dongelen on 11-04-11.
//  Copyright 2011 Wanna See. All rights reserved.
//

#import "WebBrowserViewController.h"

@implementation WebBrowserViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Handling of user interface

- (IBAction) go{
    NSURL * url =[NSURL URLWithString:[urlTextField text]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
}
@end
