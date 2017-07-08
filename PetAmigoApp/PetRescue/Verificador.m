//
//  Verificador.m
//  PetRescue
//
//  Created by Pedro Brandão on 07/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Verificador.h"
#import "Constantes.h"

@implementation Verificador

// Método do TextFieldValidator
+ (BOOL)validateString:(NSString*)stringToSearch withRegex:(NSString*)regexString {
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    return [regex evaluateWithObject:stringToSearch];
}

+ (NSError *)validaCampo:(NSString *)campo comString:(NSString *)string eRegexDictionary:(NSDictionary *)regexDict {
    
    NSError *erro = nil;
    
    if ([regexDict count] == 0) {
        erro = [NSError errorWithDomain:CONTA_DOMAIN code:000 userInfo:@{NSLocalizedDescriptionKey: @"Erro tentando ler regexCampo..."}];
        return erro;
    }
    
    NSArray *regexs = regexDict[campo];
    
    if ([regexs count] == 0) {
        erro = [NSError errorWithDomain:CONTA_DOMAIN code:000 userInfo:@{NSLocalizedDescriptionKey: @"Não há regex..."}];
        return erro;
    }
    
    for (NSString *rgx in regexs) {
        if (![Verificador validateString:string withRegex:rgx]) {
            
            NSString *mensagem = [[Constantes regexMensagem] valueForKey:rgx];
            erro = [NSError errorWithDomain:CONTA_DOMAIN code:000 userInfo:@{NSLocalizedDescriptionKey: mensagem}];
            return erro;
        }
    }
    
    return erro;
}

@end
