//
//  Constantes.h
//  PetRescue
//
//  Created by Pedro Brandão on 01/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PAISES_URL @"http://api.londrinaweb.com.br/PUC/Paisesv2/0/1000"
#define ESTADOS_BR_URL @"http://api.londrinaweb.com.br/PUC/Estados/BR/0/10000"
#define CONTAS_URL @"http://localhost/3000/contas.json"

// UI texts
#define PET_AMIGO @"Pet Amigo"
#define NOME_FIELD @"Nome"
#define SENHA_FIELD @"Senha"
#define EMAIL_FIELD @"Email"
#define JA_TEM_CONTA @"Já tem uma conta?"
#define ENTRAR_BUTTON @"Entrar"
#define CRIAR_BUTTON @"CRIAR CONTA"

#define NOME_INVALIDO @"Nome inválido"
#define NOME_EXISTE @"Nome já existe"
#define NOME_VALIDO @"Nome é valido"
#define EMAIL_EXISTE @"Email já cadastrado"
#define SENHA_NAO @"Senha não confere"

#define ESPERE_TEXT @"Por favor espere"
#define VERIFIQUE_TEXT @"Verifique os dados"
#define TENTE_TEXT @"Tente outra vez"
#define TUDO_CERTO @"Tudo certo!"
#define NAO_PUDE_CRIAR @"Não pude criar"
#define ERRO_AQUI @"Houve um erro aqui"
#define CONTA_INEXISTE @"Conta não existe"
#define CONTA_CRIADA @"Conta criada com sucesso!"
#define CONTA_INVALIDA @"Conta inválida"

#define NOME_TEXT1 @"nome1"
#define NOME_PEDRO @"pedro"

#define EMAIL_TEXT1 @"email1@email.com"
#define EMAIL_PEDRO @"pedro@email.com"

#define SENHA_TEXT1 @"000001"
#define RETURN_BUTTON @"Return"
#define OK_BUTTON @"OK"

#define CONTA_DOMAIN @"Conta Domain"
#define CONTA @"Conta"

#define SEGUE_POST @"seguePost"
#define FILTER_MATCHES @"%K MATCHES %@"

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

+(NSDictionary *)regexMensagem;

@end
