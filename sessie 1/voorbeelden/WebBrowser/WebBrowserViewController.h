//
//  WebBrowserViewController.h
//  WebBrowser
//
//  Created by Raymond van Dongelen on 11-04-11.
//  Copyright 2011 Wanna See. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebBrowserViewController : UIViewController {
    IBOutlet UIWebView * webview;
    IBOutlet UITextField * urlTextField;
    
}

- (IBAction) go;


@end
