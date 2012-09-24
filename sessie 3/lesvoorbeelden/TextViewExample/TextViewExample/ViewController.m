//
//  ViewController.m
//  TextViewExample
//
//  Created by Raymond Van Dongelen on 9/24/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSLog (@"Should begin editing");
    [_statusField setText:@"start edit"];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    NSLog (@"Text view ended editing");
    [_statusField setText:@"end edit"];

    return YES;
}


@end
