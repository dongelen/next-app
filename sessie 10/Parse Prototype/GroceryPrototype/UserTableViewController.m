//
//  UserTableViewController.m
//  GroceryPrototype
//
//  Created by Martin Walvius on 10/7/12.
//  Copyright (c) 2012 Martin Walvius. All rights reserved.
//

#import "UserTableViewController.h"

@interface UserTableViewController ()

@end

@implementation UserTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        PFQuery *user = [PFUser query];
        _userArray = [user findObjects];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_userArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Foobar"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Foobar"];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.textLabel.textColor = [UIColor blueColor];
        
    }
    
    PFUser *user = [_userArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [user objectForKey:@"username"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFUser *user = [_userArray objectAtIndex:indexPath.row];
    [_currentObject.ACL setReadAccess:YES forUser:user];
    [_currentObject.ACL setWriteAccess:YES forUser:user];
    [_currentObject save];
    NSString *message = [NSString stringWithFormat:@"U heeft een nieuwe lijst ontvangen van %@ met titel: %@", [PFUser currentUser].username,     [_currentObject objectForKey:@"title"]];
    [PFPush sendPushMessageToChannelInBackground:user.objectId withMessage:message];
    [self dismissModalViewControllerAnimated:YES];
    

}

@end
