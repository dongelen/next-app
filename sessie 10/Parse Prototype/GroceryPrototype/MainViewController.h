//
//  MainViewController.h
//  GroceryProto
//
//  Created by Martin Walvius on 10/10/12.
//  Copyright (c) 2012 Martin Walvius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListsTableViewController.h"
#import <Parse/Parse.h>


@interface MainViewController : UIViewController <ListsTableViewControllerDelegate, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UITextField *objectField;
@property (nonatomic, retain) UITextField *titleField;
@property (nonatomic, retain) NSMutableArray *objectArray;
@property (nonatomic, retain) PFObject *currentObject;
@property (nonatomic, retain) ListsTableViewController *listView;

@property (nonatomic)BOOL first;

@end
