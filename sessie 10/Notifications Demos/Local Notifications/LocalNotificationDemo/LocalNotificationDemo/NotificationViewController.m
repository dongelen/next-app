//
//  NotificationViewController.m
//  LocalNotificationDemo
//
//  Created by Erik van der Wal on 13-11-12.
//  Copyright (c) 2012 Erik van der Wal. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()
{
    UITextField *alertText;
    NSArray *sections;
}

@end

@implementation NotificationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        alertText = [self textFieldWithText:@"" placeholder:@"Text to display"];
        
        UITableViewCell *cell1 = [self textFieldCellWithTitle:@"Alert Text" textField:alertText];
        
        UITableViewCell *cell2 = [self buttonCellWithText:@"Schedule"];
        
        sections = @[ @[cell1], @[cell2] ];
    }
    return self;
}

- (void)setNotification
{
    // Maak notificatie
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    [notification setAlertAction:@"Bekijk"]; // Vertalen doe je normaliter met NSLocalizedString()
    [notification setAlertBody:alertText.text];
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    [notification setApplicationIconBadgeNumber:1];
    
    // Schedule notificatie
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"Demo"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[sections objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        [self setNotification];
    }
}

#pragma mark - Conveniance Methods

- (UITextField *)textFieldWithText:(NSString *)text placeholder:(NSString *)placeholder
{
    UITextField *textField = [[UITextField alloc] init];
    [textField setPlaceholder:placeholder];
    [textField setFrame:CGRectMake(120.0, 12.0, 170.0, 32.0)];
    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    return textField;
}

- (UITableViewCell *)textFieldCellWithTitle:(NSString *)title textField:(UITextField *)textField
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell.textLabel setText:title];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell addSubview:textField];
    return cell;
}

- (UITableViewCell *)buttonCellWithText:(NSString *)text
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell.textLabel setText:text];
    [cell.textLabel setTextColor:[UIColor colorWithRed:50.0f/255.0f green:79.0f/255.0f blue:133.0f/255.0f alpha:1]];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    return cell;
}

@end
