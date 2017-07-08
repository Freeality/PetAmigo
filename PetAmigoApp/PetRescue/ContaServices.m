//
//  ContaServices.m
//  PetRescue
//
//  Created by Pedro Brandão on 14/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ContaServices.h"
#import "Constantes.h"
#import "UIUtils.h"
#import "ContaController.h"

@implementation ContaServices

+ (BOOL)contaValidaParaAdicionarNaViewController:(ContaViewController *)contaViewController {
    
    if (![UIUtils saoValidosOsTextFieldValidator:@[contaViewController.nomeField, contaViewController.emailField, contaViewController.senhaField]]) {
        [UIUtils alertaOkComMensagem:VERIFIQUE_TEXT eTitulo:TENTE_TEXT naView:contaViewController];
        return NO;
    }
    
    ContaController *contaController = [ContaController sharedController];
    
    if ([ContaServices existeContaComNome:contaViewController.nomeField.text noArray:contaController.contas]) {
        [UIUtils alertaOkComMensagem:NOME_EXISTE eTitulo:TENTE_TEXT naView:contaViewController];
        return NO;
    }
    
    if ([ContaServices existeContaComEmail:contaViewController.emailField.text noArray:contaController.contas]) {
        [UIUtils alertaOkComMensagem:EMAIL_EXISTE eTitulo:TENTE_TEXT naView:contaViewController];
        return NO;
    }
    
    return YES;
}

+ (BOOL)contaAutenticaNaViewController:(ContaViewController *)contaViewController {
    
    if (![UIUtils saoValidosOsTextFieldValidator:@[contaViewController.nomeField, contaViewController.senhaField]]) {
        [UIUtils alertaOkComMensagem:VERIFIQUE_TEXT eTitulo:TENTE_TEXT naView:contaViewController];
        return NO;
    }
    
    ContaController *contaController = [ContaController sharedController];
    
    Conta *contaExist = [ContaServices buscaContaComNome:contaViewController.nomeField.text noArray:contaController.contas];
    
    if (!contaExist) {
        [UIUtils alertaOkComMensagem:CONTA_INEXISTE eTitulo:TENTE_TEXT naView:contaViewController];
        return NO;
    }
    
    if (![[contaExist Senha] isEqualToString:contaViewController.senhaField.text]) {
        [UIUtils alertaOkComMensagem:SENHA_NAO eTitulo:TENTE_TEXT naView:contaViewController];
        return NO;
    }
    
    return YES;
}

+ (void)setupTextFieldsWithViewController:(ContaViewController *)contaVC {
    
    [contaVC.nomeField addRegx:REGEX_USER_NAME_LIMIT
                    withMsg:REGEX_USER_NAME_LIMIT_MSN];
    [contaVC.nomeField addRegx:REGEX_USER_NAME
                    withMsg:REGEX_USER_NAME_MSN];
    
    [contaVC.senhaField addRegx:REGEX_PASSWORD_LIMIT withMsg:REGEX_PASSWORD_LIMIT_MSN];
    [contaVC.senhaField addRegx:REGEX_PASSWORD withMsg:REGEX_PASSWORD_MSN];
    
    [contaVC.emailField addRegx:REGEX_EMAIL
                     withMsg:REGEX_EMAIL_MSN];
}

/**
 * @discussion Verifica se existe uma conta com um campo nome igual ao solicitado
 * @param nome que deve ser buscado
 * @return YES se existir ou NO se não existir.
 */
+ (BOOL)existeContaComNome:(NSString *)nome noArray:(NSArray *)array {
    Conta *conta = [self buscaContaComNome:nome noArray:array];
    
    if (conta) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)existeContaComEmail:(NSString *)email noArray:(NSArray *)array {
    Conta *conta = [self buscaContaComEmail:email noArray:array];
    
    if (conta) {
        return YES;
    }
    
    return NO;
}

/**
 * @discussion Busca em contas por uma que possua o nome igual ao solicitado.
 * @param nome Nome de conta
 * @return Retorna a conta com o nome solicitado, se existir.
 * Testado.
 */
+ (Conta<Optional> *)buscaContaComNome:(NSString *)nome noArray:(NSArray *)array {
    
    Conta *conta = [self buscaContaPorCampo:NOME_FIELD comChave:nome noArray:array];
    
    if (conta) {
        return conta;
    }
    
    return nil;
}

+ (Conta<Optional> *)buscaContaComEmail:(NSString *)email noArray:(NSArray *)array {
    
    Conta *conta = [self buscaContaPorCampo:EMAIL_FIELD comChave:email noArray:array];
    
    if (conta) {
        return conta;
    }
    
    return nil;
}

+ (Conta<Optional> *)buscaContaPorCampo:(NSString *)campo comChave:(NSString *)chave noArray:(NSArray *)array {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:FILTER_MATCHES, campo, chave];
    NSArray *contaEncontrada = [array filteredArrayUsingPredicate:predicate];
    
    if (contaEncontrada.count > 0) {
        return contaEncontrada[0];
    }
    
    return nil;
}

@end
