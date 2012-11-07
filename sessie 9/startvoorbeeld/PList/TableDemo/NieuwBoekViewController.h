//
//  NieuwBoekViewController.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/31/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Boek.h"

@protocol NieuwBoekViewControllerDelegate <NSObject>
-(void)nieuwBoekToegevoegd:(Boek *)boek;
@end

@interface NieuwBoekViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titel;
@property (weak, nonatomic) IBOutlet UITextField *auteur;
@property (weak, nonatomic) id<NieuwBoekViewControllerDelegate> delegate;

- (IBAction)voegToe:(id)sender;


@end

/*
 NieuwBoekViewController * n = [NieuwBoek   alloc init enzo
 n.delegate = self;
 
 */
