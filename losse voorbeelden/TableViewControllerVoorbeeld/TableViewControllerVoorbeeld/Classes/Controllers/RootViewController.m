//
//  RootViewController.m
//  TableViewControllerVoorbeeld
//
//  Created by Erik van der Wal on 18-09-12.
//  Copyright (c) 2012 Erik van der Wal. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (strong, nonatomic) NSArray *products;

@end

@implementation RootViewController

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
       
    // Hier maken we een array met producten die we graag in de tableview willen zien en houden
    // een pointer naar deze array via de property 'products'.
    
    [self setProducts:@[ @"Apple TV", @"iMac", @"iPhone", @"iPad 2", @"iPad 3 *", @"iPhone 4S", @"iPhone 5", @"iPod nano", @"iPod Touch", @"Mac Mini", @"MacBook Air", @"MacBook Pro" ]];
    
    
        
    // Wanneer je handmatig een UIViewController initialiseert en daar een UITableView aan toevoegt, moet je ook zelf de
    // delegate en datasource zelf aangeven. Hiermee vertel je de tableview aan wie hij zijn 'vragen' moet stellen. Dit doe je
    // als volgt:
    //
    //[self.tableView setDelegate:self];
    //[self.tableView setDataSource:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; // In dit voorbeeld heeft de tableview slechts één sectie
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.products count]; // Er zijn evenveel rows als er producten zijn
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    // Wanner een cell buiten het scherm scrollt, wordt deze 'gedequeued'. In feite wordt de cell hierbij
    // gereset, maar blijft wel in het geheugen. Dit is sneller dan voor elke cell een nieuw stukje geheugen te reserveren.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Wanneer er geen cell beschikbaar is, moet je deze initialiseren. Hierbij geven we
        // dezelfde identifier mee als bij de vorige regel.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Nu we een cell hebben, kunnen we deze voorzien van (o.a.) text. We willen dat elke cell één product
    // weergeeft. We kijken daarom welke row er door de tableview wordt gevraagd, en halen het element met dezelfde
    // index als die row uit de array met products. Wanneer de 3e cell wordt opgevraagd, halen we ook het 3e element uit
    // de array op.
    NSString *productName = [self.products objectAtIndex:indexPath.row];
    
    // Vervolgens geven we deze text door aan de tablecell
    [cell.textLabel setText:productName];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Wanneer er op een cell wordt gedrukt, wordt deze methode aangeroepen. Hier kun je (bijvoorbeeld)
    // een nieuwe UIViewController initializeren, waarmee meer informatie over het specifieke product
    // wordt getoond. In dit voorbeeld deselecteren we de geslecteerde cell.
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
