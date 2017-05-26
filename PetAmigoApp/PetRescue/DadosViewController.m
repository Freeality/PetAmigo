//
//  DadosViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "DadosViewController.h"
#import "SidebarViewController.h"
#import "PostViewController.h"
#import "ContaController.h"
#import "NomeTextFieldVerificator.h"

@interface DadosViewController () {
    ContaController *control;
}

@end

@implementation DadosViewController

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    control = [ContaController sharedController];
    [self setupTextFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Custom Methods

- (void)setupTextFields {
    [self.nomeField addRegx:@"^.{3,10}$"
                    withMsg:@"Deve ter entre 3 e 10 letras"];
    [self.nomeField addRegx:@"[A-Za-z0-9]{3,10}"
                    withMsg:@"Pode apenas números e letras"];
    
    [self.senhaField addRegx:@"^.{6,20}$" withMsg:@"Deve ter entre 6 a 20 caracteres"];
    [self.senhaField addRegx:@"[A-Za-z0-9]{6,20}" withMsg:@"Deve conter letras e números"];
    
    [self.emailField addRegx:@"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z}{2,4}"
                     withMsg:@"Verifique"];
}

#pragma mark - IBACtions

- (IBAction)goBack:(id *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)criarConta:(id *)sender {
    [self goBack:sender];
}

- (IBAction)entrar:(id *)sender {
    NomeTextFieldVerificator *nomeVerificator = [NomeTextFieldVerificator sharedVerificator];
    
    if (![control verificarField:self.nomeField naView:self comVerificador:nomeVerificator]) {
        return;
    }
    
    [self performSegueWithIdentifier:@"seguePost" sender:self];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
