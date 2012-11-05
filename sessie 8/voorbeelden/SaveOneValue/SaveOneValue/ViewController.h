//
//  ViewController.h
//  SaveOneValue
//
//  Created by Raymond Van Dongelen on 11/4/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *value;

- (IBAction)setButton:(id)sender;
@end
