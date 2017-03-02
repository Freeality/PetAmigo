//
//  SWRevealControl.m
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "SWRevealControl.h"

@implementation SWRevealControl

+(void)configSidebarButton:(UIBarButtonItem *)sidebar withReveal:(SWRevealViewController *)revealVC inView:(UIViewController *)viewController {
    
    if (revealVC) {
        [sidebar setTarget:viewController.revealViewController];
        [sidebar setAction:@selector(revealToggle:)];
        [viewController.view addGestureRecognizer:viewController.revealViewController.panGestureRecognizer];
    }
}

@end
