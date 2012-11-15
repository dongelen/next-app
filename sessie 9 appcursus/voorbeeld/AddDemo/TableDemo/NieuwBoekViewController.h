//
//  NieuwBoekViewController.h
//  TableDemo
//
//  Created by Raymond Van Dongelen on 10/31/12.
//  Copyright (c) 2012 Raymond Van Dongelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Boek.h"


@interface NieuwBoekViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titel;
@property (weak, nonatomic) IBOutlet UITextField *auteur;

- (IBAction)voegToe:(id)sender;


@end
