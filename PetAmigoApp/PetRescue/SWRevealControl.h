//
//  SWRevealControl.h
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWRevealViewController.h"

@interface SWRevealControl : NSObject

+(void)configSidebarButton:(UIBarButtonItem *)sidebar withReveal:(SWRevealViewController *)revealVC inView:(UIViewController *)viewController;

@end
