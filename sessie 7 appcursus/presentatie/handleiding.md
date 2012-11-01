# Sessie 7

## Doel
Bewerken van data in een UITableView

## Lezen en doen
* Hoofdstuk 10

# Werkvoorbeeld
Korte rondleiding rond wat we de vorige keer hebben gemaakt.
Highlights: 
- Singelton
- UITableViewController

Vorige keer gevraagd een uitwerking te maken met daarin het boek uit les 2. Uitwerking al opgenomen in het voorbeeld.

# Demo 1
Toevoegen van een plus knop aan de navigatie balk

-(void)viewDidLoad
{
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(nieuwBoek)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

-(void) nieuwBoek 
{
	NSLog (@"Bla");
}


#Meedoen 1
In het project zit een viewcontroller waarmee nieuwe boeken kunnen worden toegevoegd. Deze gaan we laden in een UIPopoverViewcontroller

Toevoegen aan message "nieuwboek"
	NieuwBoekViewController *nieuwBoek = [[NieuwBoekViewController alloc] initWithNibName:@"NieuwBoekViewController" bundle:nil];
    
    
	popover = [[UIPopoverController alloc] initWithContentViewController:nieuwBoek];
    
	[popover setPopoverContentSize:CGSizeMake(300, 600)];
	[popover presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

# Demo 1
Reageren op het protocol van de popover controller


# Meedoen 2


- Protocol zelf maken
	@protocol NieuwBoekViewControllerDelegate
	-(void) nieuwBoekToegevoegd:(Boek*)boek;
	@end

- Delegate toevoegen
	@property (weak, nonatomic) id<NieuwBoekViewControllerDelegate> delegate;


# Meedoen 3

- Singleton uitbreiden


# Opgave
- Zoek uit hoe er een edit button kan worden toegevoegd


-  