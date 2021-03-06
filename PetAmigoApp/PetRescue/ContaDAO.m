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
#import "ContaController.h"

@implementation ContaDAO

#pragma mark - UI Utils

/**
 * @discussion Adiciona uma conta e emite mensagens na view controller quando necessário
 */
- (void)adicionaConta:(Conta *)conta {
    
    // Apenas durante desenvolvimento e testes
    [self.all addObject:conta];
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
        sharedDAO.path = CONTAS_URL;
    }
    
    return sharedDAO;
}

@end
