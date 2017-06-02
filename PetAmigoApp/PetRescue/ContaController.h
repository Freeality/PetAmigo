//
//  ContaController.h
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Controller.h"
#import "Conta.h"
#import "TextFieldValidator.h"

@interface ContaController : Controller

@property (nonatomic, retain)NSMutableArray *contas;

// UI Utils
- (void)adicionaContaComNome:(TextFieldValidator *)nome Email:(TextFieldValidator *)email Senha:(TextFieldValidator *)senha naViewController:(UIViewController *)vc;
- (void)validarContaComNome:(TextFieldValidator *)nome Senha:(TextFieldValidator *)senha naViewController:(UIViewController *)vc comSegueIdentifier:(NSString *)segue;

// Create
- (NSError<Optional> *)adicionar:(Conta *)conta;

// Read
- (Conta<Optional> *)buscaContaComNome:(NSString *)nome;
- (BOOL)existeContaComNome:(NSString *)nome;
- (Conta<Optional> *)buscaContaComEmail:(NSString *)email;
- (Conta<Optional> *)buscaContaPorCampo:(NSString *)campo comChave:(NSString *)chave;

// Update

// Arquitetura
+ (ContaController *)sharedController;

// Testes
- (BOOL)saoValidosOsTextFieldValidator:(NSArray<TextFieldValidator *> *)textFields;
- (void)addContasTemp;

@end
