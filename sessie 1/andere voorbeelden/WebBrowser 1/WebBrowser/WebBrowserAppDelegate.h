//
//  WebBrowserAppDelegate.h
//  WebBrowser
//
//  Created by Raymond van Dongelen on 11-04-11.
//  Copyright 2011 Wanna See. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebBrowserViewController;

@interface WebBrowserAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet WebBrowserViewController *viewController;

@end
