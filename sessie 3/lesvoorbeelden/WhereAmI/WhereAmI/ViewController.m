//
//  ViewController.m
//  WhereAmI
//
//  Created by Raymond Van Dongelen on 9/24/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    NSLog (@"Nieuwe locatie %@", newLocation);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog (@"Dikke vette fout %@", error);
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog (@"Aangeroepen viewDidLoad");

    locationManager = [[CLLocationManager alloc] init];
    
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation];
    NSLog (@"Initialized");
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
