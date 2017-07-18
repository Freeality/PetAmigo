//
//  ContaServices.m
//  PetRescue
//
//  Created by Pedro Brandão on 14/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ContaController.h"
#import "Constantes.h"
#import "UIUtils.h"
#import "ContaDAO.h"

@implementation ContaController

#pragma mark - Arquitetura
/**
 * @brief É necessário para que o singleton funcione
 */
static ContaController *sharedController = nil;

/**
 * @brief Retorna uma única instância
 */
+(ContaController *)sharedController {
    if (!sharedController) {
        sharedController = [[ContaController alloc] init];
    }
    
    return sharedController;
}

- (void)setContaVC:(ContaViewController *)contaVC {
    _contaVC = contaVC;
    [self setupTextFields];
}

#pragma mark - Actions
/**
 * @discussion Valida nome, senha e segue para próxima view
 */
- (void)autentica {
    
    if ([self contaAutentica]) {
        [self.contaVC performSegueWithIdentifier:SEGUE_POST sender:self.contaVC];
    }
}

- (void)adiciona {
    
    if (![self contaValida]) {
        return;
    }
    
    Conta *conta = [[Conta alloc]
                    initWithNome:self.contaVC.nomeField.text
                    Email:self.contaVC.emailField.text
                    eSenha:self.contaVC.senhaField.text];
    
    // Apenas durante desenvolvimento e testes
    ContaDAO *contaDAO = [ContaDAO sharedDAO];
    contaDAO.viewController = self.contaVC;
    [contaDAO.contas addObject:conta];
    
    NSString *mensagem = [NSString stringWithFormat:@"%@ %@", CONTA_CRIADA, [conta Nome]];
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:TUDO_CERTO
                                message:mensagem
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction
                                  actionWithTitle:OK_BUTTON
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action) {
                                      [alert dismissViewControllerAnimated:YES
                                                                completion:nil];
                                      [self.contaVC performSegueWithIdentifier:SEGUE_POST sender:self.contaVC];
                                  }];
    [alert addAction:alertAction];
    [self.contaVC presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Utils
- (BOOL)contaValida {
    ContaDAO *contaDAO = [ContaDAO sharedDAO];
    [contaDAO setViewController:self.contaVC];
    
    if (![UIUtils saoValidosOsTextFieldValidator:@[self.contaVC.nomeField, self.contaVC.emailField, self.contaVC.senhaField]]) {
        [UIUtils alertaOkComMensagem:VERIFIQUE_TEXT eTitulo:TENTE_TEXT naView:self.contaVC];
        return NO;
    }
    
    if ([ContaController existeContaComNome:self.contaVC.nomeField.text noArray:contaDAO.contas]) {
        [UIUtils alertaOkComMensagem:NOME_EXISTE eTitulo:TENTE_TEXT naView:self.contaVC];
        return NO;
    }
    
    if ([ContaController existeContaComEmail:self.contaVC.emailField.text noArray:contaDAO.contas]) {
        [UIUtils alertaOkComMensagem:EMAIL_EXISTE eTitulo:TENTE_TEXT naView:self.contaVC];
        return NO;
    }
    
    return YES;
}

- (BOOL)contaAutentica {
    
    if (![UIUtils saoValidosOsTextFieldValidator:@[self.contaVC.nomeField, self.contaVC.senhaField]]) {
        [UIUtils alertaOkComMensagem:VERIFIQUE_TEXT eTitulo:TENTE_TEXT naView:self.contaVC];
        return NO;
    }
    
    ContaDAO *contaDAO = [ContaDAO sharedDAO];
    
    Conta *contaExist = [ContaController buscaContaComNome:self.contaVC.nomeField.text noArray:contaDAO.contas];
    
    if (!contaExist) {
        [UIUtils alertaOkComMensagem:CONTA_INEXISTE eTitulo:TENTE_TEXT naView:self.contaVC];
        return NO;
    }
    
    if (![[contaExist Senha] isEqualToString:self.contaVC.senhaField.text]) {
        [UIUtils alertaOkComMensagem:SENHA_NAO eTitulo:TENTE_TEXT naView:self.contaVC];
        return NO;
    }
    
    return YES;
}

- (void)setupTextFields {
    
    [self.contaVC.nomeField addRegx:REGEX_USER_NAME_LIMIT
                    withMsg:REGEX_USER_NAME_LIMIT_MSN];
    [self.contaVC.nomeField addRegx:REGEX_USER_NAME
                    withMsg:REGEX_USER_NAME_MSN];
    
    [self.contaVC.senhaField addRegx:REGEX_PASSWORD_LIMIT withMsg:REGEX_PASSWORD_LIMIT_MSN];
    [self.contaVC.senhaField addRegx:REGEX_PASSWORD withMsg:REGEX_PASSWORD_MSN];
    
    [self.contaVC.emailField addRegx:REGEX_EMAIL
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
