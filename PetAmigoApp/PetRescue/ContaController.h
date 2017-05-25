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

- (BOOL)verificarField:(TextFieldValidator *)textField naView:(UIViewController *)viewC comVerificador:(NSObject<Verificador> *)verificador;

- (Conta<Optional> *)buscaContaComNome:(NSString *)nome;
- (BOOL)existeContaComNome:(NSString *)nome;
- (void)addContasTemp;

+ (ContaController *)sharedController;

@end
