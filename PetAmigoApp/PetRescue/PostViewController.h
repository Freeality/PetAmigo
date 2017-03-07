//
//  FeedViewController.h
//  PetRescue
//
//  Created by Pedro Brandão on 22/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRight;

- (IBAction)goBack:(id *)sender;

- (IBAction)goSwipe:(UISwipeGestureRecognizer *)sender;

@end
