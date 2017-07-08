//
//  ContaController.h
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Conta.h"
#import "TextFieldValidator.h"
#import "ContaViewController.h"
#import "Controller.h"
#import "Atualizador.h"

@interface ContaController : Controller

@property (nonatomic, retain)NSMutableArray *contas;

- (void)adiciona;
- (void)autentica;

// Arquitetura
+ (ContaController *)sharedController;

@end
