# Sessie 5

## Doel
Het maken van een applicatie from scratch. 
In de vorige lessen hebben we gebruik gemaakt van Storyboards. Nu wijken we daar van af.


## Lezen en doen
* Hoofdstuk 7

## Opzet

# Demo
In de demo worden een aantal zaken toegevoegd. We starten met het toevoegen van alleen een ViewController.

* Aanmaken van een project zonder storyboard
* Toevoegen nieuwe UIViewController
* In de UIViewController maken we in de init background rood


# Demo 2
Voegen nog een ViewController toe
In de appdelegate
    UITabBarController *tabs = [[UITabBarController alloc] init];
    

    NieuwBoekViewController * nieuwBoek = [[NieuwBoekViewController alloc] initWithNibName:nil bundle:nil];
    
    AllebBoekenViewController * boeken =[[AllebBoekenViewController alloc] initWithNibName:nil bundle:nil];
        
    [tabs setViewControllers:@[nieuwBoek, boeken]];
//    self.window.rootViewController = nieuwBoek;
    self.window.rootViewController = tabs;
    [self.window makeKeyAndVisible];



En we voegen een UITabBarController toe.

# Opgave 1
* Voeg de HynoseView toe aan de tabs

# Opgave 2
* Voeg een button toe, en handel de button af in code

# Opgave 3
* Maak op een tabblad twee buttons, één button verhoogt de waarde van de badge. De andere verlaagt de waarde van de badge

# Opgave 4
* Ook applicaties kunnen badges hebben. Zoek uit hoe je deze badge kunt instellen. 