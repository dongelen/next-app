# Sessie 9

## Doel
Connecties maken met een backend in Objective C

# Ondersteuning
Voor het netjes weergeven van json:
http://storageroomapp.com/documentation#demo.intro


# Opzet
Er is een rails backend die we gaan hergebruiken om het book voorbeeld mee te laten communiceren. 

Eerst even de rails app laten zien. 
url: http://still-brook-6654.herokuapp.com/books

Maken niet gebruik van de standaard wijze om URL's uit te lezen. Deze manier wordt als omslachtig gezien. 

# Voorbeeld 1
Ip adres op laten halen
NSURL *url = [NSURL URLWithString:@"http://httpbin.org/ip"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
    NSLog(@"IP Address: %@", [JSON valueForKeyPath:@"origin"]);
} failure:nil];
    
[operation start];





# Voorbeeld 2
Integratie met boeken: http://still-brook-6654.herokuapp.com/books.json


----
# Voorbeeld 3
Moeilijkheid: Dit gebeurt asynchroon!

Hoe bereikt de update van het model de UITableViewController:

Voorstel 1: Protocol/ delegate
Voorstel 2: gebruik notificaties. 

  [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveDataNotification:) 
                                                 name:@"DataUpdateNotification"
                                               object:nil];
   ...............

}
Implement receiveDataNotification: to handle DataUpdateNotification type notification.

- (void) receiveDataNotification:(NSNotification *) notification
{
     if ([[notification name] isEqualToString:@"DataUpdateNotification"])
     {
        NSLog (@"Successfully received the Data Update notification!");
     }
}
Remove the notification from your object instance when your controller is disappeared.

- (void)viewWillDisappear:(BOOL)animated 
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}