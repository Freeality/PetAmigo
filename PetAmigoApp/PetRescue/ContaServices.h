//
//  ContaServices.h
//  PetRescue
//
//  Created by Pedro Brandão on 14/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContaViewController.h"
#import "Conta.h"

@interface ContaServices : NSObject

+ (void)setupTextFieldsWithViewController:(ContaViewController *)contaVC;

// Read
+ (Conta *)buscaContaComNome:(NSString *)nome noArray:(NSArray *)array;
+ (BOOL)existeContaComNome:(NSString *)nome noArray:(NSArray *)array;
+ (Conta *)buscaContaComEmail:(NSString *)email noArray:(NSArray *)array;
+ (Conta *)buscaContaPorCampo:(NSString *)campo comChave:(NSString *)chave noArray:(NSArray *)array;
+ (BOOL)existeContaComEmail:(NSString *)email noArray:(NSArray *)array;
+ (BOOL)contaAutenticaNaViewController:(ContaViewController *)contaViewController;
+ (BOOL)contaValidaParaAdicionarNaViewController:(ContaViewController *)contaViewController;

@end
