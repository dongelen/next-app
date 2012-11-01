# Sessie 6

## Doel
Maken van een UITableViewController en intro UINavigationController

## Lezen en doen
* Hoofdstuk 9


# Demo
Starten met een helemaal lege applicatie
* Voeg toe een class "BookListViewController" toe die erft van UITableViewController
* Zet die als rootviewcontroller in de appdelegate
* Houd in BookListViewController alleen de volgende messages over
** initWithStyle
** numberOfSectionsInTableView
** numberOfRowsInSection
** cellForRowAtIndexPath

Code voor cellForRow wordt:
static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
        
	if (!cell)
	{
	    cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

	    NSLog (@"Bla");
	}

	[[cell textLabel] setText:@"Hallo"];
    
    
	return cell;



# Demo 2
Voegen nu een zinvol element toe. Een boekenlijst. 
Dit doen weer eerst met behulp van een instance variable.

Aan de init:
	bookList =@[@"Big nerd ranch", @"Tropical truth", @"Punished by rewards"];

In de numberOfRowsInSection
    return [bookList count];


	- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
	{
	    static NSString *CellIdentifier = @"Cell";
	    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
        
	    if (!cell)
	    {
	        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	    }

	    [[cell textLabel] setText:bookList[indexPath.row]];
    
    
	    return cell;
	}
	



#Demo 3
Toevoegen van een navigationcontroller aan de tabel.
Toevoegen van didselectrow met een lege view controller (misschien met een kleurtje ofzo)

# Demo 4
Voegen een singleton toe aan het project. Doel is om de boeken op een goede plaats te hebben staan. 

@implementation BookStore

-(id) init
{
    self = [super init];
    if (self){
        allBooks =@[@"Big nerd ranch", @"Tropical truth", @"Punished by rewards"];
    }
    return self;
}

- (NSArray*)  books
{
    return allBooks;
}


+ (BookStore*) sharedStore
{
    static BookStore * sharedStore = nil;
    if (!sharedStore){
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}
@end

# Opgaven

## Opgave 1
Er zijn verschillende stijlen voor tabellen, zet de tabel om in een andere stijl


## Opgave 2
Er zijn verschillende stijlen voor cellen, probeer er een aantal uit.

## Opgave 3
Voeg verschillende secties toe

## Opgave 4
Bouw support in voor het voorbeeld uit sessie 2. Hierbij hebben we een boeken class gemaakt.
Pas hiervoor de BookStore zodanig aan dat hij gebruik maakt van de Books class die je al hebt gemaakt. 
