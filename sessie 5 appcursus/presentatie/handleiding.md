# Sessie 5

## Doel
Het doel van vandaag is het leren werken met UIViews

## Lezen en doen
* Hoofdstuk 6

## Opzet
Voor de pauze UIView, na de pauze motion dingen
# Demo 1
Aanmaken van een "rodeview"
* De rode view wordt in de init rood gemaakt
* Deze wordt toegevoegd aan een demo view controller
* Vervolgens nog een instantie
* Uitleggen positie en grootte


# Demo 2
Aan een UIView worden meerdere zaken toegevoegd. Een label, en een button
* Er wordt een nieuwe view toegevoegd 
* Een UILabel + een UIButton

* Aan de button wordt een actie toegevoegd
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];                        
	[button setFrame:CGRectMake(10, 400, 100, 100)];    
	[button addTarget:self action:@selector(buttonPressedAction:) forControlEvents:UIControlEventTouchUpInside];

* In de demo controller worden een aantal views toegevoegd



--
*	Gratis demo: Leuke animatie
	[UIView animateWithDuration:2 animations:^{
	    [view1 setFrame:CGRectMake(400,400, 10,10)];
	}];

# Opgaven

Start:
* Verander het lettertype in de button 
* Maak een button aan van een ander type
* Wat gebeurt er als je een label een te kleine CGRect meegeeft?

Moeilijker:
* Maak met behulp van een for lus 10 keer een "RodeView" aan. Deze verschijnen netjes onder elkaar

Moeilijk:
* Voeg aan de Vijand class een afbeelding toe
* Voeg in de animatie toe dat de rode rechthoek half transparant wordt
* Ga in het boek aan de slag met hoofdstuk 6, maak hieruit de oefening Hypnosister