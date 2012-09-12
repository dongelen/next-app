//
//  ViewController.h
//  FabBrowser
//
//  Created by Raymond Van Dongelen on 9/12/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UITextField *urlbar;
- (IBAction)goButton:(id)sender;

@end
