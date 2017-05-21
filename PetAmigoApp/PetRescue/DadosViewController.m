//
//  DadosViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "DadosViewController.h"

@interface DadosViewController ()

@end

@implementation DadosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)criarConta:(id *)sender {
    [self goBack:sender];
}

- (IBAction)entrar:(id *)sender {
    [self goBack:sender];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
