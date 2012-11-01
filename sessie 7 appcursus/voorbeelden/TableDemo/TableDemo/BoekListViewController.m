//
//  BookListViewController.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BoekListViewController.h"
#import "BoekStore.h"
#import "NieuwBoekViewController.h"
@interface BoekListViewController ()

@end

@implementation BoekListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Boeken";
        [self laadOpnieuw];
    }
    return self;
}

-(void)viewDidLoad
{
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(nieuwBoek)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

- (void)laadOpnieuw
{
    alleBoeken = [[BoekStore sharedBooks] allBooks];

    [self.tableView reloadData];
}

-(void) nieuwBoek
{

    NieuwBoekViewController *nieuwBoek = [[NieuwBoekViewController alloc] initWithNibName:@"NieuwBoekViewController" bundle:nil];
    
    nieuwBoek.delegate = self;
    popover = [[UIPopoverController alloc] initWithContentViewController:nieuwBoek];
    popover.delegate = self;
    
    [popover setPopoverContentSize:CGSizeMake(300, 600)];
    [popover presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog (@"And its gone");
}

- (void) nieuwBoekToegevoegd:(Boek *)boek
{
    [[BoekStore sharedBooks] voegBoekToe:boek];
    [self laadOpnieuw];
    [popover dismissPopoverAnimated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [alleBoeken count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Boek * boek = alleBoeken [indexPath.row];
    
    [[cell textLabel] setText:boek.title];
    [[cell detailTextLabel] setText:boek.author];
    return cell;
}






@end
