//
//  NieuwBoekViewController.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/30/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "NieuwBoekViewController.h"

@interface NieuwBoekViewController ()

@end

@implementation NieuwBoekViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (IBAction)voegToe:(id)sender {
    NSLog (@"Pressed");
    [self.delegate boekToegevoegd:[Boek bookWithAuthor:@"Test" andTitle:@"Auteur"]];
}
@end
