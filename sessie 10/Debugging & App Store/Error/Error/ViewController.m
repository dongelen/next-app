//
//  ViewController.m
//  Error
//
//  Created by Thom Hoekstra on 13-11-12.
//  Copyright (c) 2012 Thom Hoekstra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UITextField *emailField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPeoplePicker:(id)sender
{
    ABPeoplePickerNavigationController *controller = [[ABPeoplePickerNavigationController alloc] init];
    controller.displayedProperties = @[[NSNumber numberWithInt:kABPersonEmailProperty]];
    
    // Fix: controller.peoplePickerDelegate = self;
    
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    return YES;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    
    ABMultiValueRef emailProperty = ABRecordCopyValue(person, property);
    NSInteger emailIndex = ABMultiValueGetIndexForIdentifier(emailProperty, identifier);
    
    // Fout
    NSString *emailString = (__bridge NSString *)ABMultiValueCopyValueAtIndex(emailProperty, emailIndex);
    // Goed
    // NSString *emailString = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(emailProperty, emailIndex);
    
    self.emailField.text = emailString;
    
    // Fix: CFRelease(emailProperty);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
