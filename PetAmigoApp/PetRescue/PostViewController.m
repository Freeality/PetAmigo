//
//  FeedViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 22/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "PostViewController.h"
#import "SidebarViewController.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id *)sender {
    
    [self volta];
}

- (IBAction)goSwipe:(UISwipeGestureRecognizer *)sender {
    
    [self volta];
}

-(void)volta {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
