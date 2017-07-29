//
//  DadosViewController.m
//  PetRescue
//
//  Foi criada aqui uma arquitetura MVC provisória para que o app
//  pudesse ser testado tem um servidor. Porém, a idéia é que o app
//  faça somente o papel de view na arquitetura, fazendo suas requisições
//  ao servidor que fará o processamento e retornará o resultado em JSON.
//  Somente o modelo Conta permanecerá com essa estrutura. Os demais modelos
//  farão as requisições diretamente da view controller.
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
@property (nonatomic, retain) Conta *contaAutenticada;

@end

@implementation ContaViewController

- (void)vaiParaPost {
    [self performSegueWithIdentifier:SEGUE_POST sender:nil];
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

/**
 * @brief contaAutenticada verifica se o usuário já fez o login.
 */
- (Conta *)contaAutenticada {
    if (!_contaAutenticada) {
        NSData *conta = (NSData *)[self.contaController.defaults objectForKey:CONTA];
        if (!conta) {
            return nil;
        }
        NSError *erro;
        _contaAutenticada = [[Conta alloc] initWithData:conta error:&erro];
        if (erro != nil) {
            NSLog(@"\n\nErro tentando criar conta: %@\n\n", erro.localizedDescription);
        }
    }
    return _contaAutenticada;
}

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contaController = [ContaController sharedController];
    [self.contaController setContaVC:self];
    
    [self addContasTemp];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.contaAutenticada) {
        NSLog(@"\n\nConta existe no NSUserDefaults...%@\n\n", self.contaAutenticada);
        [self vaiParaPost];
    }
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

@end
