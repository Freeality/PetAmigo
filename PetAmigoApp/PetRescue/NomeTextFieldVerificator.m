//
//  NomeTextFieldValidator.m
//  PetRescue
//
//  Created by Pedro Brandão on 25/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "NomeTextFieldVerificator.h"
#import "ContaController.h"

@interface NomeTextFieldVerificator() {
    ContaController *control;
}
@end

@implementation NomeTextFieldVerificator

static NomeTextFieldVerificator *sharedVerificator = nil;

+(NomeTextFieldVerificator *)sharedVerificator {
    if (!sharedVerificator) {
        sharedVerificator = [[NomeTextFieldVerificator alloc] init];
    }
    return sharedVerificator;
}

-(id)init {
    self = [super init];
    if (self) {
        control = [ContaController sharedController];
    }
    return self;
}

-(BOOL)verificarTextField:(TextFieldValidator *)textField NaView:(UIViewController *)viewC {
    
    if (![textField validate]) {
        [self alertaOkComMensagem:@"Verifique o nome" naView:viewC];
        return NO;
    }
    
    if (![control existeContaComNome:textField.text]) {
        [self alertaOkComMensagem:@"Usuário ainda não criado" naView:viewC];
        return NO;
    }
    
    return YES;
}

@end
