//
//  DadosViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ContaViewController.h"
#import "SidebarViewController.h"
#import "PostViewController.h"
#import "ContaDAO.h"
#import "ContaController.h"
#import "UIUtils.h"
#import "Constantes.h"
#import "ObjectDAO.h"
#import <AFNetworking.h>

@interface ContaViewController ()

@property (nonatomic, retain) ContaController *contaController;
@property (nonatomic, retain) NSMutableArray *posts;
@property (nonatomic, retain) ObjectDAO *paisController;

@end

@implementation ContaViewController

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contaController = [ContaController sharedController];
    [self.contaController setContaVC:self];
    
    [self addContasTemp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - AtualizaProtocol

- (void)atualiza {
    // Conferindo se os controllers carregaram os dados corretamente
    NSLog(@"\n\nIsso aqui é executado dentro do bloco success do AFNetwork");
}

#pragma mark - IBACtions

/**
 * @discussion Verifica se os campos são válidos e cria a conta caso positivo
 * !!!: Não foi testado ainda
 */
- (IBAction)criarConta:(id *)sender {
    
    [self.contaController adiciona];
}

- (IBAction)entrar:(id *)sender {
    
    [self.contaController autentica];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

/**
 * @brief Adiciona 3 contas para testes.
 * Testado.
 */
- (void)addContasTemp {
    NSArray *nomes = @[@"nome1", @"nome2", @"nome3"];
    NSArray *senhas = @[@"000001", @"000002", @"000003"];
    NSArray *emails = @[@"email1@email.com", @"email2@email.com", @"email3@email.com"];
    
    for (int i = 0; i < nomes.count; i++) {
        Conta *conta = [[Conta alloc] initWithNome:nomes[i] Email:emails[i] eSenha:senhas[i]];
        [conta save];
    }
}

@end
