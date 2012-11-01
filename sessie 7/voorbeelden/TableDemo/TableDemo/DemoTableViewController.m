//
//  DemoTableViewController.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/18/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "DemoTableViewController.h"
#import "ToonBoekViewController.h"
#import "BoekenOverviewStore.h"


@interface DemoTableViewController ()

@end

@implementation DemoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        BoekenOverviewStore * store =[BoekenOverviewStore sharedBoekenOverviewStore];
        
        boeken = [store alleBoeken];
        self.title = @"Boeken";
    }
    return self;
}

- (void) viewDidLoad
{
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(nieuwBoek)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

- (void)nieuwBoek
{
    NieuwBoekViewController *nieuwBoek = [[NieuwBoekViewController alloc] initWithNibName:@"NieuwBoekViewController" bundle:nil];
    
    nieuwBoek.delegate=self;
    popover = [[UIPopoverController alloc] initWithContentViewController:nieuwBoek];

    [popover setDelegate:self];
    [popover setPopoverContentSize:CGSizeMake(300, 600)];
    [popover presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

    NSLog (@"Nieuw boek");
}

-(void)boekToegevoegd:(Boek *) nieuwBoek
{
    [popover dismissPopoverAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [boeken count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    // Aanmaken en eventueel hergebruiken cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.textLabel setText:[boeken[indexPath.row] title]];


    return cell;
}

#pragma mark - Table view delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToonBoekViewController * boekViewController = [[ToonBoekViewController alloc] initWithNibName:nil bundle:nil];
    [boekViewController setBoek:boeken[indexPath.row]];
    [self.navigationController pushViewController:boekViewController animated:YES];
}





@end
