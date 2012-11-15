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
        
        [BoekStore sharedBooks].boeksChangedBlock= ^(Boek* boek){
            [self.tableView reloadData];
        };
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (void) viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(nieuweData)
                                                 name:@"BoekStoreUpdate"
                                               object:nil];
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
