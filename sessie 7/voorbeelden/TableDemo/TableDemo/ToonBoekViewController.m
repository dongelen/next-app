//
//  ToonBoekViewController.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/18/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "ToonBoekViewController.h"

@interface ToonBoekViewController ()

@end

@implementation ToonBoekViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Toon een boek";
    }
    return self;
}

-(void)setBoek:(Boek *)boek
{
    self.title = boek.title;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
