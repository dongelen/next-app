//
//  UserTableViewController.h
//  GroceryPrototype
//
//  Created by Martin Walvius on 10/7/12.
//  Copyright (c) 2012 Martin Walvius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface UserTableViewController : UITableViewController

@property (nonatomic, retain) PFObject *currentObject;
@property (nonatomic, retain) NSArray *userArray;

@end
