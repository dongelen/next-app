//
//  MainViewController.m
//  GroceryProto
//
//  Created by Martin Walvius on 10/10/12.
//  Copyright (c) 2012 Martin Walvius. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "UserTableViewController.h"
#import "ListsTableViewController.h"
#import <Parse/Parse.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _listView = [[ListsTableViewController alloc] init];
        _listView.delegate = self;

        _first = YES;
        _objectArray = [[NSMutableArray alloc] init];
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithTitle:@"Actie" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(popActionSheet)];

    self.navigationItem.rightBarButtonItem = shareButton;
    [self setTitle:@"Grocery.app"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    
    _titleField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width - 20, 35)];
    [_titleField setPlaceholder:@"Titel"];
    [_titleField setFont:[UIFont systemFontOfSize:16.0f]];
    [_titleField setBorderStyle:UITextBorderStyleRoundedRect];
    [_titleField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_titleField setKeyboardType:UIKeyboardTypeEmailAddress];
    [_titleField setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    _objectField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, self.view.bounds.size.width - 110, 35)];
    [_objectField setPlaceholder:@"Ingrediënt"];
    [_objectField setFont:[UIFont systemFontOfSize:16.0f]];
    [_objectField setBorderStyle:UITextBorderStyleRoundedRect];
    [_objectField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_objectField setKeyboardType:UIKeyboardTypeEmailAddress];
    [_objectField setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [addButton setFrame:CGRectMake(_objectField.frame.origin.x + _objectField.frame.size.width, 50, 50, 35)];
    [addButton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
   
    [self.view addSubview:addButton];
    [self.view addSubview:_objectField];
    [self.view addSubview:_titleField];
    [self.view addSubview:_tableView];
}

- (void)save
{
    
    [_objectArray addObject:_objectField.text];
    [_objectField setText:@""];
    [_objectField resignFirstResponder];
    [_tableView reloadData];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    if (_first) {
        [self presentViewController:[[LoginViewController alloc] init] animated:NO completion:^{
        }];
        _first = NO;
    }
  
}

- (void)popActionSheet
{
   UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:@"Wat wilt u doen"
                                        delegate:self
                               cancelButtonTitle:@"Cancel"
                          destructiveButtonTitle:nil
                                             otherButtonTitles:@"Opslaan", @"Delen", @"Oude lijstjes",@"Logout", nil];

    [sheet showInView:self.view];    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        if (![_titleField.text length] || ![_objectArray count]) {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Kan niet opslaan"
                                                              message:@"U heeft niet alles ingevuld"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            [message show];

        }
        else{
            if (!_currentObject){
                PFUser *user = [PFUser currentUser];
                PFObject *listObject = [PFObject objectWithClassName:@"groceryList"];
                [listObject setObject:_titleField.text forKey:@"title"];
                [listObject setObject:_objectArray forKey:@"items"];
                listObject.ACL = [PFACL ACLWithUser:user];
                [listObject setObject:user.username forKey:@"owner"];
                [listObject save];
                [self setCurrentObject:listObject];
            }
            else{
                [_currentObject setObject:_titleField.text forKey:@"title"];
                [_currentObject setObject:_objectArray forKey:@"items"];
                [_currentObject save];            
            }

        }
    }
    else if (buttonIndex == 1) {
        if (!_currentObject){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"!!!!!!" message:@"Sla je lijst eerst op" delegate:self cancelButtonTitle:@"Oke" otherButtonTitles:nil];
            [alert show];
        }
        else{
            UserTableViewController *userView = [[UserTableViewController alloc] init];
            [userView setCurrentObject:_currentObject];
            [self.navigationController pushViewController:userView animated:YES];
          
        }
    }
    else if (buttonIndex == 2){
        [self.navigationController pushViewController:_listView animated:YES];
        [_listView getLists];

    }
    else if (buttonIndex == 3){

        [PFUser logOut];
        [self presentViewController:[[LoginViewController alloc] init] animated:NO completion:^{
        }];
    }
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
    return [_objectArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Foobar"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Foobar"];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.textLabel.textColor = [UIColor blueColor];
        
    }
    
    cell.textLabel.text = [_objectArray objectAtIndex:indexPath.row];
    
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objectArray removeObjectAtIndex:indexPath.row];
        [_tableView reloadData];
    }
}

- (void)ListsTableViewControllerDidDismissWithObject:(PFObject *)object
{
    [_objectArray removeAllObjects];
    [self.navigationController popViewControllerAnimated:YES];
    _currentObject = object;
    _objectArray = [NSMutableArray arrayWithArray:[_currentObject objectForKey:@"items"]];
    [_titleField setText:[_currentObject objectForKey:@"title"]];
    [_tableView reloadData];
};

@end
