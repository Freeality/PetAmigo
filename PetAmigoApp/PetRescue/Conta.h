//
//  Conta.h
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "ContaViewController.h"
#import "Atualizador.h"

@interface Conta : JSONModel

@property (nonatomic, retain)NSString *Nome;
@property (nonatomic, retain)NSString *Email;
@property (nonatomic, retain)NSString *Senha;

@property (nonatomic, retain)NSDictionary <Ignore> *regexCampo;

-(id)initWithNome:(NSString *)nome Email:(NSString *)email eSenha:(NSString *)senha;
-(void)save;
-(BOOL)isValid;

+(NSArray<Conta *> *)all;

+(void)setViewController:(ContaViewController<AtualizaProtocol> *)vc;

@end
