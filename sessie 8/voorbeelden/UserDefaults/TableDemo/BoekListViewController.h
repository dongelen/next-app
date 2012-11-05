//
//  BookListViewController.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NieuwBoekViewController.h"

@interface BoekListViewController : UITableViewController <UIPopoverControllerDelegate, NieuwBoekViewControllerDelegate>
{
    NSArray * alleBoeken;
    UIPopoverController * popover;
}
@end
