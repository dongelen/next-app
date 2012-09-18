The next app 2
===
* Veel code
* Kennismaking tests
* Class maken

!

Sessie 1 was
===
* Kennismaking
* Outlet + actions

!

Testen
===
* Test drive development
* Standaard ondersteund in Xcode
* Uitspreken verwachtingen
* Mee laten groeien met code


!

Code 1
===

!

Variablen
===

Aanmaken:
uint variabeleNaam = 10;

!

Veel gebruikt
===
* NSString en NSMutableString
* NSArray en NSMutableArray
* NSDictionary en NSMutableDictionary

!

Code 2
===

!

Oefening
===
* Voeg 10 maal in een loop een waarde toe aan een array
* Verwijder een element uit een Array



!

Code 3
===

!

Classes 
===
* Bestaan uit een header & implementation file
* Header beschrijft buitenkant (.h)
* Implementation bevat alle details over implementatie (.m)

!

Header
===
	@interface MyClass:NSObject{
		int myVariable;
	}
	- (void) myMessage;



!
Implementation
===
		
	@implementation MyClass
	- (void) myMessage
	{
		NSLog (@"My message");
	}
	@end

!

Property 
===
In header file:

@property (nonatomic, retain) NSString * author;


!

Message syntax
===
-(void) myMessage:(NSString*) param1 andOtherParam:(NSString*)param2 {
	NSLog (@ " Message %@ and %@",
	param1, param2); 
}

!

Call message
===
	[object myMessage:@"Hello" andOtherParam:@"Other message"];


!

Oefening 2
===
Voegt toe aan de classes
* ISBN
* Een manier om een boek te verwijderen
* Een manier om het goedkoopste boek op te halen

!

Volgende keer
===
* Lezen hoofdstuk 2
* Delegates & protocols
* Iets over geheugen management.