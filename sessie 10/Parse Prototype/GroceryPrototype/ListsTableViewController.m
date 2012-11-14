//
//  ListsTableViewController.m
//  Vera
//
//  Created by Martin Walvius on 10/7/12.
//
//

#import "ListsTableViewController.h"
#import "MainViewController.h"
#import <Parse/Parse.h>


@interface ListsTableViewController ()

@end

@implementation ListsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)getLists
{
    [_array removeAllObjects];
    PFQuery *query = [PFQuery queryWithClassName:@"groceryList"];
    _array = [NSMutableArray arrayWithArray:[query findObjects]]; 

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Foobar"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Foobar"];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.textLabel.textColor = [UIColor blueColor];
        
    }
    
    PFObject *list = [_array objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [list objectForKey:@"title"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Eigenaar: %@", [list objectForKey:@"owner"]];

    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PFObject *list = [_array objectAtIndex:indexPath.row];
    [self.delegate ListsTableViewControllerDidDismissWithObject:list];

    
}

@end
