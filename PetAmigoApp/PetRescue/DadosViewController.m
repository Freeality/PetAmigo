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
#import "Constantes.h"

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
    [self.nomeField addRegx:REGEX_USER_NAME_LIMIT
                    withMsg:REGEX_USER_NAME_LIMIT_MSN];
    [self.nomeField addRegx:REGEX_USER_NAME
                    withMsg:REGEX_USER_NAME_MSN];
    
    [self.senhaField addRegx:REGEX_PASSWORD_LIMIT withMsg:REGEX_PASSWORD_LIMIT_MSN];
    [self.senhaField addRegx:REGEX_PASSWORD withMsg:REGEX_PASSWORD_MSN];
    
    [self.emailField addRegx:REGEX_EMAIL
                     withMsg:REGEX_EMAIL_MSN];
}

- (BOOL)fieldsValidos {
    if (!(self.nomeField.validate || !self.senhaField.validate || !self.emailField.validate)) {
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
