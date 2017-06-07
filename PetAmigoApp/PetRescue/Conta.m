//
//  Conta.m
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Conta.h"
#import "Constantes.h"

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

- (void)setNome:(NSString *)nome {
    
    NSError *erro = [self validaNome:nome];
    
    if (erro) {
        NSLog(@"\n\n%@: %@\n\n", nome, erro.localizedDescription);
        return;
    }
    
    _Nome = nome;
}

// Método do TextFieldValidator
- (BOOL)validateString:(NSString*)stringToSearch withRegex:(NSString*)regexString {
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    return [regex evaluateWithObject:stringToSearch];
}

- (NSError<Optional> *)validaNome:(NSString *)nome {
    
    NSError *erro = NULL;
    
    /*
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:REGEX_USER_NAME
                                  options:0
                                  error:&erro];
    
    NSInteger matchesCount = [regex numberOfMatchesInString:nome options:0 range:NSMakeRange(0, nome.length)];
     
    
    if (matchesCount == 0) {
        erro = [NSError errorWithDomain:@"Conta" code:000 userInfo:@{NSLocalizedDescriptionKey: REGEX_USER_NAME_MSN}];
    }
    
    NSLog(@"\n\nMathes: %d, Erro... %@\n\n", matchesCount, erro.localizedDescription);
     
     */
    
    if ([self validateString:nome withRegex:REGEX_USER_NAME]) {
        erro = [NSError errorWithDomain:@"Conta" code:000 userInfo:@{NSLocalizedDescriptionKey: REGEX_USER_NAME_MSN}];
    }
    
    if ([self validateString:nome withRegex:REGEX_USER_NAME_LIMIT]) {
        erro = [NSError errorWithDomain:@"Conta" code:000 userInfo:@{NSLocalizedDescriptionKey: REGEX_USER_NAME_LIMIT_MSN}];
    }
    
    return erro;
}

@end
