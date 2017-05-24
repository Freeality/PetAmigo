//
//  Conta.m
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Conta.h"

@implementation Conta

-(id)initWithNome:(NSString *)nome Email:(NSString *)email eSenha:(NSString *)senha {
    
    self = [super init];
    
    if (self) {
        self.Nome = nome;
        self.Email = email;
        self.Senha = senha;
    }
    return self;
}

@end
