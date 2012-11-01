//
//  DemoTableViewController.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/18/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NieuwBoekViewController.h"
@interface DemoTableViewController : UITableViewController <UIPopoverControllerDelegate, NieuwBoekViewControllerDelegate>
{
    UIPopoverController *popover;
    NSArray * boeken;
}
@end
