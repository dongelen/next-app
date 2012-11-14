//
//  ListsTableViewController.h
//  Vera
//
//  Created by Martin Walvius on 10/7/12.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@protocol ListsTableViewControllerDelegate<NSObject>

@required

- (void)ListsTableViewControllerDidDismissWithObject:(PFObject *)object;

@end

@interface ListsTableViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, assign) id<ListsTableViewControllerDelegate> delegate;

-(void)getLists;

@end
