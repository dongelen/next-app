//
//  MessageViewController.m
//  PushNotificationDemo
//
//  Created by Erik van der Wal on 14-11-12.
//  Copyright (c) 2012 Erik van der Wal. All rights reserved.
//

#import "MessageViewController.h"
#import "PushAPIClient.h"

@interface MessageViewController () <UITextFieldDelegate>
{
    UITextField *messageField;
    NSArray *sections;
}
@end

@implementation MessageViewController

- (id)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        messageField = [self textFieldWithText:@"" placeholder:@"Message to send"];
        [messageField setDelegate:self];
        
        UITableViewCell *cell1 = [self textFieldCellWithTitle:@"Message" textField:messageField];
        UITableViewCell *cell2 = [self buttonCellWithText:@"Send message"];
        
        sections = @[ @[cell1], @[cell2] ];
    }
    return self;
}

- (void)sendMessage
{
    [[PushAPIClient sharedInstance] sendMessage:messageField.text];
    [messageField setText:@""];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"Push Demo"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [self sendMessage];
    }
}

#pragma mark - Conveniance Methods

- (UITextField *)textFieldWithText:(NSString *)text placeholder:(NSString *)placeholder
{
    CGRect frame;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        frame = CGRectMake(150.0, 12.0, 400.0, 32.0);
    } else {
        frame = CGRectMake(120.0, 12.0, 170.0, 32.0);
    }
    
    UITextField *textField = [[UITextField alloc] init];
    [textField setPlaceholder:placeholder];
    [textField setFrame:frame];
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

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"OK");
    return YES;    
}

@end
