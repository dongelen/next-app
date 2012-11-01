//
//  NieuwBoekViewController.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/30/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Boek.h"

@protocol NieuwBoekViewControllerDelegate
-(void)boekToegevoegd:(Boek *) nieuwBoek;
@end

@interface NieuwBoekViewController : UIViewController
- (IBAction)voegToe:(id)sender;

@property (nonatomic, assign) id<NieuwBoekViewControllerDelegate> delegate;

@end
