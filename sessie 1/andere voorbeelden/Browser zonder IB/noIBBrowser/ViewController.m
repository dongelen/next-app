//
//  ViewController.m
//  noIBBrowser
//
//  Created by Thom Hoekstra on 16-09-12.
//  Copyright (c) 2012 Thom Hoekstra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (nonatomic, strong) UIBarButtonItem *forwardButton;

@end

@implementation ViewController

@synthesize webView, textField, backButton, forwardButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Maak de toolbar aan
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 44.0f)];
    // De toolbar moet zijn breedte aanpassen aan de beschikbare ruimte
    bar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    // Maak het invoerveld aan
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width - 120.0f, 31.0f)]; // -120 om ruimte te maken voor de knoppen
    self.textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.keyboardType = UIKeyboardTypeURL;
    self.textField.returnKeyType = UIReturnKeyGo;
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.textField.font = [UIFont systemFontOfSize:14.0f];
    self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing; // Kruisje tonen bij het invoeren
    
    self.textField.delegate = self; // delegate
    
    // Maak de knoppen aan
    self.backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back)]; // Deze knop roept de methode back (@selector(back)) aan op self, hetzelfde als een lijntje maken vanuit IB, maar dan in code
    
    self.forwardButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(forward)]; // Deze knop roept de methode back (@selector(forward)) aan op self
    
    // Stop de knoppen in een array een geef ze aan de toolbar
    bar.items = [NSArray arrayWithObjects: self.backButton, self.forwardButton,
                 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)], // Refresh knop
                 [[UIBarButtonItem alloc] initWithCustomView:self.textField], nil];
    
    // Voeg de toolbar toe aan de view
    [self.view addSubview:bar];
    
    // Maak de webview aan
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, self.view.frame.size.width, self.view.frame.size.height - 44.0f)];
    // De webview moet zijn hoogte en breedte aanpassen aan de beschikbare ruimte
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // Voeg de webview toe aan de view
    [self.view addSubview:self.webView];
    
    self.webView.delegate = self; // delegate
    
    // Begin standaard met google
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.nl"]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)back
{
    [self.webView goBack];
}

- (void)forward
{
    [self.webView goForward];
}

- (void)refresh
{
    [self.webView reload];
}

// Textfield delegate: De gebruiker heeft op de return knop gedrukt
- (BOOL)textFieldShouldReturn:(UITextField *)field
{
    NSString *urlString = field.text;

    if (![[field.text lowercaseString] hasPrefix:@"http://"]) // Heeft de ingevoerde url GEEN http:// ervoor?
    {
        urlString = [NSString stringWithFormat:@"http://%@", field.text]; // Voeg http:// toe
    }
    
    // laad de ingevoerde url
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
    // verberg het toetsenbord
    [field resignFirstResponder];
    return YES;
}

// Webview delegate: de url is geladen
- (void)webViewDidFinishLoad:(UIWebView *)view
{
    self.textField.text = view.request.URL.absoluteString; // toon de url in het textfield
    self.backButton.enabled = self.webView.canGoBack; // kunnen we terug? zoja maak de terugknop actief
    self.forwardButton.enabled = self.webView.canGoForward; // kunnen we vooruit? zoja maak de vooruitknop actief
}

// Webview delegate: kon de url niet laden
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // Maak een alert aan
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fout" message:@"De ingevoerde url kon niet worden geladen" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    // Laat de alert zien
    [alert show];
}

@end
