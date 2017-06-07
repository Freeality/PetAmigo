//
//  Constantes.h
//  PetRescue
//
//  Created by Pedro Brandão on 01/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NOME_FIELD @"Nome"
#define NOME_TEXT1 @"nome1"
#define NOME_PEDRO @"pedro"
#define NOME_INVALIDO @"Nome inválido"

#define EMAIL_FIELD @"Email"
#define EMAIL_TEXT1 @"email1@email.com"
#define EMAIL_PEDRO @"pedro@email.com"

#define SENHA_TEXT1 @"000001"
#define SENHA_FIELD @"Senha"

#define RETURN_BUTTON @"Return"
#define ENTRAR_BUTTON @"Entrar"
#define CRIAR_BUTTON @"CRIAR CONTA"
#define OK_BUTTON @"OK"

#define TENTE_TEXT @"Tente outra vez"
#define TUDO_CERTO @"Tudo certo!"

#define VERIFIQUE_TEXT @"Verifique os dados"
#define CONTA_INEXISTE @"Conta não existe"
#define SENHA_NAO @"Senha não confere"
#define NOME_EXISTE @"Nome já existe"
#define EMAIL_EXISTE @"Email já cadastrado"
#define NAO_PUDE_CRIAR @"Não pude criar a conta"
#define CONTA_CRIADA @"Conta criada com sucesso!"

#define SEGUE_POST @"seguePost"
#define FILTER_MATCHES @"%K MATCHES %@"

#define ERRO101 @"Conta inválida"

#define REGEX_USER_NAME_LIMIT @"^.{3,10}$"
#define REGEX_USER_NAME_LIMIT_MSN @"Deve ter entre 3 e 10 digitos"
#define REGEX_USER_NAME @"[A-Za-z0-9]{3,10}"
#define REGEX_USER_NAME_MSN @"Números e letras entre 3 e 10 digitos"
#define REGEX_EMAIL @"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define REGEX_EMAIL_MSN @"Email inválido"
#define REGEX_PASSWORD_LIMIT @"^.{6,20}$"
#define REGEX_PASSWORD_LIMIT_MSN @"Deve ter entre 6 a 20 digitos"
#define REGEX_PASSWORD @"[A-Za-z0-9]{6,20}"
#define REGEX_PASSWORD_MSN @"Letras e números entre 6 e 20 digitos"
#define REGEX_PHONE_DEFAULT @"[0-9]{3}\\-[0-9]{3}\\-[0-9]{4}"

@interface Constantes : NSObject

@end
