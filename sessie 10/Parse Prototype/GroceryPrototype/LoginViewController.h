//
//  LoginViewController.h
//  GroceryPrototype
//
//  Created by Martin Walvius on 10/7/12.
//  Copyright (c) 2012 Martin Walvius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) UITextField *userName;
@property (nonatomic, retain) UITextField *passWord;
@property (nonatomic, retain) UITextField *email;


@end
