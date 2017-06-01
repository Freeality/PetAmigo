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
#import "UIUtils.h"

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

- (BOOL)fieldsValidos {
    if (!self.nomeField.validate || !self.senhaField.validate || !self.emailField.validate) {
        return NO;
    }
    
    return YES;
}

#pragma mark - IBACtions

/**
 * @discussion Verifica se os campos são válidos e cria a conta caso positivo
 * !!!: Não foi testado ainda
 */
- (IBAction)criarConta:(id *)sender {
    
    [control adicionaContaComNome:self.nomeField
                            Email:self.emailField
                            Senha:self.senhaField
                 naViewController:self];
}

- (IBAction)entrar:(id *)sender {
    
    [control validarContaComNome:self.nomeField
                           Senha:self.senhaField
                naViewController:self
              comSegueIdentifier:@"seguePost"];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
