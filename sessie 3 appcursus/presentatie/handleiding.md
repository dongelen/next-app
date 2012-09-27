# Sessie 3

## Doel
Delegates & Protocollen

## Lezen en doen
* Hoofdstuk 4


## Opzet
De stuctuur van delegates en protocollen wordt duidelijk door een aantal voorbeelden te implementeren.

## Code sessie 1
* Create new project.
* Add UITextView
* Set AppDelegate as a delegate for the UITextView
* Add UITextViewDelegate protocol to the class
* Set delegate
* Show protocol definition
* Build 
(Explain that protocol is satisfied)
* Add UiTextField, connect to outlet
* Dislay the status changes in this field

## Code 
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSLog (@"Text view started editing");
    statusField.text = @"Text view started editing";
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    NSLog (@"Text view ended editing");    
    statusField.text = @"Text view ended editing";
    return YES;
}


Besteedt hierbij ook even aandacht aan naamconventies:
Naming delegates (from Cocoa Design patterns):
Naming Delegate Messages
There is a convention to the way messages sent to delegates are named. Each such mes- sage starts with an identification of the type of object that sends the message. The delegate messages sent by the MYBarView class all start with barView. Delegate messages usually include one of three verbs: should, will, or did.
Messages that use should are expected to return a value and usually take an argument that directly identifies the object sending the message. These messages are sent to the del- egate before a change to the object sending the message. The delegate is given an opportu- nity to influence the change. For example, Cocoa’s NSText object sends the -textShouldBeginEditing: message to its delegate and expects a Boolean return value. If the delegate returns NO, editing does not begin. In this way, the delegate influences the behavior of the object that sends the messages.
Messages that use will are not expected to return values. These messages are sent be- fore a change happens and are strictly informative. The delegate can implement a method to synchronize the application’s state or perform additional processing when such a message is received.
Finally, the did messages are sent after a change happens. These messages are also strictly informative and give the delegate an opportunity to perform processing after the change.

# Na de pauze

Class aanmaken
* Maak iPhone window project aan met naam Book
* Maak een class aan met de naam Book
* Laat class zien en vertel over header en implementation files
* Maak test method “testNewBook” 
* Include toevoegen 
Property toevoegen
* Property toevoegen 
@property (nonatomic, retain) NSString * author;





