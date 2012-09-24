//
//  ViewController.h
//  TextViewExample
//
//  Created by Raymond Van Dongelen on 9/24/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *statusField;

@end
