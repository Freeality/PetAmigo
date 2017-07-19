//
//  Conta.m
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Conta.h"
#import "Constantes.h"
#import "Verificador.h"
#import "ContaDAO.h"

@interface Conta()

@property (nonatomic, retain)ContaDAO *dao;

@end

@implementation Conta

id campos[] = { @"nome", @"email", @"senha" };

-(id)initWithNome:(NSString *)nome Email:(NSString *)email eSenha:(NSString *)senha {
    
    self = [super init];
    
    if (self) {
        [self setNome:nome];
        [self setEmail:email];
        [self setSenha:senha];
    }
    
    if (!self.isValid) {
        return nil;
    }
    
    return self;
}

- (BOOL)isValid {
    return !(!_Nome || !_Email || !_Senha);
}

-(ContaDAO *)dao {
    return [ContaDAO sharedDAO];
}

+(NSArray<Conta *> *)all {
    
    return [ContaDAO sharedDAO].all;
}

+(void)setViewController:(ContaViewController<AtualizaProtocol> *)vc {
    ContaDAO *dao = [ContaDAO sharedDAO];
    [dao setViewController:vc];
}

-(void)save {
    if (self.isValid) {
        [self.dao.all addObject:self];
    }
}

- (NSDictionary *)regexCampo {
    if (!_regexCampo) {
        _regexCampo = @{campos[0]: @[REGEX_USER_NAME, REGEX_USER_NAME_LIMIT],
                        campos[1]: @[REGEX_EMAIL],
                        campos[2]: @[REGEX_PASSWORD, REGEX_PASSWORD_LIMIT] };
    }
    return _regexCampo;
}

- (void)setNome:(NSString *)nome {
    
    NSError *erro = [Verificador validaCampo:campos[0]
                                   comString:nome
                            eRegexDictionary:self.regexCampo];
    if (!erro) {
        _Nome = nome;
    }
}

- (void)setEmail:(NSString *)email {
    
    NSError *erro = [Verificador validaCampo:campos[1]
                                   comString:email
                            eRegexDictionary:self.regexCampo];
    if (!erro) {
        _Email = email;
    }
}

- (void)setSenha:(NSString *)senha {
    NSError *erro = [Verificador validaCampo:campos[2]
                                   comString:senha
                            eRegexDictionary:self.regexCampo];
    if (!erro) {
        _Senha = senha;
    }
}

@end
