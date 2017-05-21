//
//  ViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 21/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIEffects.h"

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRight;
- (IBAction)goSwipeRight:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIEffects efeitoBrilhoParaLabel:self.tituloLabel naCor:[UIColor greenColor]];
    
    self.control = [ContaController sharedController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)retornaAoInicio:(UIStoryboardSegue *)segue {
}

- (IBAction)goBack:(UIBarButtonItem *)sender {
    [self volta];
}
- (IBAction)goSwipeRight:(id)sender {
    [self volta];
}

-(void)volta {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
