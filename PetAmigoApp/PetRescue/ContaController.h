//
//  ContaController.h
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conta.h"

@interface ContaController : NSObject

@property (nonatomic, retain)NSMutableArray *contas;

- (Conta<Optional> *)buscaContaComNome:(NSString *)nome;
- (void)addContasTemp;

+ (ContaController *)sharedController;

@end
