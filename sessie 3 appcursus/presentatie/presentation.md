The next app 3
===
* Terugblik
* Delegates & protocols

!

Sessie 2 was
===
* Overzicht Objective C
* Sla hoofdstuk 3 voorlopig over

!

Messages ontvangen
===
* Objecten willen weten of er iets in de interface is veranderd
* Andere talen gebruiken vaak EventListeners
* Cocoa gebruikte delegates & protocols

!

Delegate
=== 
* Ontvangt boodschappen van een doel object
* Volgens een protocol
* Sommige messages zijn verplicht
* Sommige zijn optioneel

!

Code sessie 1
===

!

UITextViewDelegate
===
* Laat de ViewContoller "conformeren" aan het protocol
* Lees het protocol voor de mogelijkheden en verplichtingen
* Laat weten dat de class de delegate is

!

Verschillen met EventListers
===
* Maar één "luisteraar" voor een object
* Lidmaatschap is niet voor één event, maar voor alles.

!

Code sessie groep 1
===
Voeg aan het voorbeeld van de webbrowser een indicator toe als er geladen wordt. 
Gebruik hiervoor een delegate op de Webview

!

Code sessie 2 groep 2
===
* Maak het voorbeeld op pagina 84 van de Big nerd ranch 
* Code staat op p84, en p86
* Zet de code van p84 niet in de init, maar in de viewDidLoad
* Voeg toe p97 bronze en silver challenge

!


Pauze
===

!

Demostratie boekenclass
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

Afsluitende oefening
===
* Beginner: voeg toe ISBN
* Beginner: voeg toe een lijst(array) van boeken
* Gevorderd: Maak een Books class, deze bevat een rij boeken. 
* Gevorderd: Er kan gezocht worden op het goedkoopste boek

!

Toegift:
===
* Geheugenmanagement: Lees hfd 3 pas als je de taal ECHT in de vingers hebt. 
* Er zweven veel oude voorbeelden (voor iOs 5), mijdt deze voorbeelden eerst.

!

Volgende keer
===
* Lezen hoofdstuk 4, probeer de oefeningen 
* Voeg aan de webbrowser uit les 1 een progress indicator toe
* Zorg ervoor dat deze werkt op een iPhone/ iPad
