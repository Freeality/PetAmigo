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
#import "ObjectDAO.h"
#import "Atualizador.h"

@interface ContaDAO : ObjectDAO

@property (nonatomic, retain)NSMutableArray *contas;

- (void)adiciona;
- (void)autentica;

// Arquitetura
+ (ContaDAO *)sharedDAO;

@end
