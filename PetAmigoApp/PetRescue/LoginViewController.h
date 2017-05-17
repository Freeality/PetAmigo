//
//  ViewController.h
//  PetRescue
//
//  Created by Pedro Brandão on 21/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContaController.h"

@interface LoginViewController : UIViewController

@property (nonatomic, retain)ContaController *control;

- (IBAction)goBack:(UIBarButtonItem *)sender;

@end

