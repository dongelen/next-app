# Sessie 2

## Doel
Kennismaking met de taal Objective C, kennismaken met unit testing.

## Lezen en doen
* Hoofdstuk 2
* Overzicht van C: http://www.cocoadevcentral.com/articles/000081.php
* Literals http://clang.llvm.org/docs/ObjectiveCLiterals.html


## Opzet
* Werken met basis types
* Classes aanmaken

## Docentinstructie
In deze sessie worden een aantal zaken gecombineerd. De cursisten maken kennis met unit testen en de taal Objective C door eenvoudige stukjes code te maken en deze meteen te testen. Begrip van testen is niet belangrijk: het wordt ingezet als snelle methode om code uit te kunnen proberen. 


### Code 1
Maak nieuw project met alleen window
* Leg kort uit over setup en teardown, niet zo belangrijk voor nu.
* Maak een test die twee uint bij elkaar optelt.
* Tel twee NSInteger bij elkaar op..
* Wat is het verschil tussen ints en NSInteger
	

### Code 2
* Wat elementen toevoegen
* Even een loop en wat loggen

### Oefening 1
5 minuten, loop + verwijderen uit array


### Code 3
Demo:
* Class toevoegen die we gaan testen
* Class met boeken
Class aanmaken
* Maak iPhone window project aan met naam Book
* Maak een class aan met de naam Book
* Laat class zien en vertel over header en implementation files
* Maak test method “testNewBook” 
* Include toevoegen 
Property toevoegen
* Property toevoegen 
@property (nonatomic, retain) NSString * author;

* Toon warning
* Maak synthesize
* Maak test die property set en weer ophaalt en test op juiste waarde
Method toevoegen:
* showDescriptionInLog (een functie die de author naar de log stuurt)
Class toevoegen: WSBooks
* Met instance variabele NSMutableArray books
* addBook method
* Nu wel handig om een handigere init te maken bij WSBook waaraan de auteur en title aan mee kan worden gegeven.
* selectBooksForAuthor toevoegen aan WSBooks eerst met nil implementeren.


### Oefening 2

* Voeg aan WSBooks een message toe waarmee een boek kan worden verwijderd
* Voeg aan WSBook het isbn nummer toe
* Voeg aan WSBook een prijs toe
* Voeg aan WSBooks een message toe om het goedkoopste boek op te halen
* Objective C heeft ook een while lus, zoek uit hoe die werkt.


Voeg voor alle oefeningen de juiste testsets toe.
