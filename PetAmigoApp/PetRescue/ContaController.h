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
#import "VerificadorProtocol.h"

@interface ContaController : Controller

@property (nonatomic, retain)NSMutableArray *contas;

// UI Utilidades
- (BOOL)verificarField:(TextFieldValidator *)textField naView:(UIViewController *)viewC comVerificador:(NSObject<Verificador> *)verificador;

// Create
- (NSError<Optional> *)adicionar:(Conta *)conta;

// Read
- (Conta<Optional> *)buscaContaComNome:(NSString *)nome;
- (BOOL)existeContaComNome:(NSString *)nome;

// Update

// Arquitetura
+ (ContaController *)sharedController;

// Testes
- (void)addContasTemp;
- (NSError<Optional> *)eValida:(Conta *)conta;

@end
