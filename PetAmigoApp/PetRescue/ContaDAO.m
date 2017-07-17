//
//  ContaController.m
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ContaDAO.h"
#import "UIUtils.h"
#import "Constantes.h"
#import "ContaServices.h"

@implementation ContaDAO

- (NSMutableArray *)contas {
    if (!_contas) {
        _contas = [[NSMutableArray alloc] init];
    }
    return _contas;
}

#pragma mark - UI Utils

/**
 * @discussion Valida nome, senha e segue para próxima view
 */
- (void)autentica {
    
    if ([ContaServices contaAutenticaNaViewController:(ContaViewController *)self.viewController]) {
        [self.viewController performSegueWithIdentifier:SEGUE_POST sender:self.viewController];
    }
}

/**
 * @discussion Adiciona uma conta e emite mensagens na view controller quando necessário
 */
- (void)adiciona {
    
    ContaViewController *contaViewController = (ContaViewController *)self.viewController;
    
    if (![ContaServices contaValidaParaAdicionarNaViewController:contaViewController]) {
        return;
    }
    
    Conta *conta = [[Conta alloc]
                    initWithNome:contaViewController.nomeField.text
                    Email:contaViewController.emailField.text
                    eSenha:contaViewController.senhaField.text];
    
    // Apenas durante desenvolvimento e testes
    [self.contas addObject:conta];
    
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
                                      [self.viewController performSegueWithIdentifier:SEGUE_POST sender:self.viewController];
                                  }];
    [alert addAction:alertAction];
    [self.viewController presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Arquitetura
/**
 * @brief É necessário para que o singleton funcione
 */
static ContaDAO *sharedDAO = nil;

/**
 * @brief Retorna uma única instância
 */
+(ContaDAO *)sharedDAO {
    if (!sharedDAO) {
        sharedDAO = [[ContaDAO alloc] init];
    }
    
    return sharedDAO;
}

@end
