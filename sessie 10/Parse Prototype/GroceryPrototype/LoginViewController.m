//
//  LoginViewController.m
//  GroceryPrototype
//
//  Created by Martin Walvius on 10/7/12.
//  Copyright (c) 2012 Martin Walvius. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "MainViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        _email  = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 200, 35)];
        [_email setDelegate:self];
        [_email setPlaceholder:@"Email"];
        [_email setCenter:self.view.center];
        [_email setFrame:CGRectMake(_email.frame.origin.x, _email.frame.origin.y - 170, _email.frame.size.width, _email.frame.size.height)];
        [_email setFont:[UIFont systemFontOfSize:16.0f]];
        [_email setBorderStyle:UITextBorderStyleRoundedRect];
        [_email setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_email setKeyboardType:UIKeyboardTypeEmailAddress];
        [_email setAutocorrectionType:UITextAutocorrectionTypeNo];
        
        _userName  = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 200, 35)];
        [_userName setPlaceholder:@"Username"];
        [_userName setDelegate:self];
        
        [_userName setCenter:self.view.center];
        [_userName setFrame:CGRectMake(_userName.frame.origin.x, _userName.frame.origin.y - 120, _userName.frame.size.width, _userName.frame.size.height)];
        [_userName setFont:[UIFont systemFontOfSize:16.0f]];
        [_userName setBorderStyle:UITextBorderStyleRoundedRect];
        [_userName setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_userName setKeyboardType:UIKeyboardTypeEmailAddress];
        [_userName setAutocorrectionType:UITextAutocorrectionTypeNo];
        
        _passWord  = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 200, 35)];
        [_passWord setPlaceholder:@"Password"];
        [_passWord setDelegate:self];
        [_passWord setCenter:self.view.center];
        [_passWord setSecureTextEntry:YES];
        [_passWord setFrame:CGRectMake(_passWord.frame.origin.x, _passWord.frame.origin.y - 80, _passWord.frame.size.width, _passWord.frame.size.height)];
        [_passWord setFont:[UIFont systemFontOfSize:16.0f]];
        [_passWord setBorderStyle:UITextBorderStyleRoundedRect];
        [_passWord setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_passWord setKeyboardType:UIKeyboardTypeEmailAddress];
        [_passWord setAutocorrectionType:UITextAutocorrectionTypeNo];
        
        UIButton *login = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [login setFrame:CGRectMake(_passWord.frame.origin.x, _passWord.frame.origin.y + 50, _passWord.frame.size.width, _passWord.frame.size.height)];
        [login setTitle:@"Login" forState:UIControlStateNormal];
        [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *signUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [signUp setFrame:CGRectMake(_passWord.frame.origin.x, _passWord.frame.origin.y + 100, _passWord.frame.size.width, _passWord.frame.size.height)];
        [signUp setTitle:@"Sign Up" forState:UIControlStateNormal];
        [signUp addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:signUp];
        [self.view addSubview:_email];
        [self.view addSubview:login];
        [self.view addSubview:_userName];
        [self.view addSubview:_passWord];
    }
    return self;
}

- (void)login{
    [_passWord resignFirstResponder];
    [PFUser logInWithUsernameInBackground:_userName.text password:_passWord.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self dismissViewControllerAnimated:YES completion:^{
                                                NSArray *channels = [[PFPush getSubscribedChannels:nil] allObjects];
                                                [channels enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                                    if (![obj isEqualToString:user.objectId]){
                                                        [PFPush unsubscribeFromChannelInBackground:obj];
                                                    }
                                                }];
                                                [PFPush subscribeToChannelInBackground:user.objectId];
                                            }];
                                            NSArray *channels = [[PFPush getSubscribedChannels:nil] allObjects];
                                        } else {
                                            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Uw login gegevens zijn onjuist!"
                                                message:@"Probeer het nog eens."
                                                delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
                                                [message show];
                                        }
                                    }];
}

- (void)signUp{
    PFUser *user = [PFUser user];
    user.username = _userName.text;
    user.password = _passWord.text;
    user.email = _email.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Uw account is aangemaakt!"
                                                              message:@"Verifieer uw account in de email die u heeft gekregen."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
                                                    [message show];
        } else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Uw account is aangemaakt!"
                                                              message:errorString
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            [message show];
        }
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
