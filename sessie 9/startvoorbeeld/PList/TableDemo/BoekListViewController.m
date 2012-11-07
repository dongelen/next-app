//
//  BookListViewController.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BoekListViewController.h"
#import "BoekStore.h"

@interface BoekListViewController ()

@end

@implementation BoekListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Boeken";
        alleBoeken = [[BoekStore sharedBooks] allBooks];
    }
    return self;
}

- (void) viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nieuweData) name:@"BoekStoreChanged" object:nil];
}

- (void)nieuweData
{
    [self vernieuw];
}

-(void) viewDidLoad
{
    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(nieuwBoek)];

    [self.navigationItem setRightBarButtonItem: addButton];
}

- (void) nieuwBoek
{
    [popover dismissPopoverAnimated:NO];

    NieuwBoekViewController * nieuwBoek= [[NieuwBoekViewController alloc] initWithNibName:@"NieuwBoekViewController" bundle:nil];

    popover = [[UIPopoverController alloc] initWithContentViewController:nieuwBoek];
    
    popover.delegate = self;
    nieuwBoek.delegate = self;
    
    [popover setPopoverContentSize:CGSizeMake(300, 300)];
    [popover presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog (@"And its gone!");
}

-(void) nieuwBoekToegevoegd:(Boek *)boek
{
    NSLog(@"Er is een nieuw boek");
    
    [[BoekStore sharedBooks] voegBoekToe:boek];
    [self vernieuw];
    [popover dismissPopoverAnimated:YES];
}

- (void) vernieuw
{
    alleBoeken = [[BoekStore sharedBooks] allBooks];
    [self.tableView reloadData];
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
