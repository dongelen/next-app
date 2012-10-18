//
//  BookListViewController.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/9/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BookListViewController.h"
#import "DoNothingViewController.h"

@interface BookListViewController ()

@end

@implementation BookListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
        
    if (!cell)
    {
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [[cell textLabel] setText:@"Hallo"];
    
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog (@"CLick");
    DoNothingViewController * doNothing = [[DoNothingViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:doNothing animated:YES];
}

@end
