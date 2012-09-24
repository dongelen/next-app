//
//  ViewController.h
//  WhereAmI
//
//  Created by Raymond Van Dongelen on 9/24/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager * locationManager;
}
@end
