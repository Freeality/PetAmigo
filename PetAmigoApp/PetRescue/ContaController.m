//
//  ContaController.m
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ContaController.h"
#import <AFNetworking.h>

@implementation ContaController

static NSString *contasUrlSring = @"http://localhost:8080/contas";

- (NSMutableArray *)contas {
    
    if (!_contas) {
        _contas = [[NSMutableArray alloc] init];
        [self addContasTemp];
    }
    
    return _contas;
}

- (Conta<Optional> *)buscaContaComNome:(NSString *)nome {
    
    NSString *filter = @"%K MATCHES %@";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:filter, @"Nome", nome];
    NSArray *contaEncontrada = [self.contas filteredArrayUsingPredicate:predicate];
    
    if (contaEncontrada.count > 0) {
        return contaEncontrada[0];
    }
    
    return nil;
}

- (void)addContasTemp {
    NSArray *nomes = @[@"nome1", @"nome2", @"nome3"];
    NSArray *senhas = @[@"001", @"002", @"003"];
    NSArray *emails = @[@"email1", @"email2", @"email3"];
    
    self.contas = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < nomes.count; i++) {
        Conta *conta = [[Conta alloc] initWithNome:nomes[i] Email:emails[i] eSenha:senhas[i]];
        [self.contas addObject:conta];
    }
}

- (void)buscaContas {
    /* problemas aqui
    NSURL *contasUrl = [NSURL URLWithString:contasUrlSring];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:contasUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        self.contas = (NSMutableArray<Conta> *)[Conta arrayOfModelsFromData:data error:nil];
        [self logContas];
        
    }] resume];
     */
}

- (void)AFbuscaContas {
    NSDictionary *param = @{@"id": @1};
    NSURL *contasUrl = [NSURL URLWithString:contasUrlSring];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:contasUrl.absoluteString parameters:param progress:^(NSProgress * downloadProgress) {
        // progresso aqui
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        // sucesso aqui
        self.contas = (NSMutableArray<Conta> *)[Conta arrayOfModelsFromDictionaries:responseObject error:nil];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // falha aqui
    }];
}

- (void)logContas {
    // tratando os dados aqui
    for (Conta *c in self.contas) {
        NSLog(@"\nnome: %@", c.Nome);
    }
}

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
        [sharedController buscaContas];
    }
    
    return sharedController;
}

@end
