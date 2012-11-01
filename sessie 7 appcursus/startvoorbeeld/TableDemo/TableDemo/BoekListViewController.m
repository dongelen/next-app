//
//  BookListViewController.m
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/10/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import "BookListViewController.h"
#import "BookStore.h"
#import "Book.h"
@interface BookListViewController ()

@end

@implementation BookListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self reload];
    }
    return self;
}

-(void)viewDidLoad
{
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(nieuwBoek)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

-(void) reload
{
    alleBoeken = [[BookStore sharedBooks] allBooks];
    [self.tableView reloadData];
}


-(void)nieuwBoek
{
    
    NieuwBoekViewController *nieuwBoek = [[NieuwBoekViewController alloc] initWithNibName:@"NieuwBoekViewController" bundle:nil];
    
    nieuwBoek.delegate = self;
    
    popover = [[UIPopoverController alloc] initWithContentViewController:nieuwBoek];
    
    [popover setDelegate:self];
    [popover setPopoverContentSize:CGSizeMake(300, 600)];
    [popover presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    NSLog (@"Nieuw boek");
    
}

- (void) nieuwBoekToegevoegd:(Book *)book
{
    NSLog (@"Terug in de booklistviewcontroller");
    [[BookStore sharedBooks] addBook:book];
    [popover dismissPopoverAnimated:YES];
    [self reload];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Book * book = alleBoeken[indexPath.row];
    [[cell textLabel] setText:book.title];
    return cell;
}






@end
