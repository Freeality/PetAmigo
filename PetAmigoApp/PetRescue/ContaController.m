//
//  ContaController.m
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ContaController.h"
#import <AFNetworking.h>
#import "DadosViewController.h"

@implementation ContaController

static NSString *contasUrlSring = @"http://localhost:8080/contas";

#pragma mark - Getters

- (NSMutableArray *)contas {
    
    if (!_contas) {
        _contas = [[NSMutableArray alloc] init];
        [self addContasTemp];
    }
    
    return _contas;
}

#pragma mark - Create

/**
 * @brief Temporariamente a conta será adicionada somente no array
 */
- (NSError<Optional> *)adicionar:(Conta *)conta {
    
    [self.contas addObject:conta];
    
    return nil;
}

#pragma mark - Read

/**
 * @discussion Verifica se existe uma conta com um campo nome igual ao solicitado
 * @param nome que deve ser buscado
 * @return YES se existir ou NO se não existir.
 * !!!: Não foi testado ainda.
 */
- (BOOL)existeContaComNome:(NSString *)nome {
    Conta *conta = [self buscaContaComNome:nome];
    
    if (conta) {
        return YES;
    }
    
    return NO;
}

/**
 * @discussion Busca em contas por uma que possua o nome igual ao solicitado.
 * @param nome Nome de conta
 * @return Retorna a conta com o nome solicitado, se existir. Testado.
 */
- (Conta<Optional> *)buscaContaComNome:(NSString *)nome {
    // Retorna a conta com o nome solicitado, se existir. Testado.
    NSString *filter = @"%K MATCHES %@";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:filter, @"Nome", nome];
    NSArray *contaEncontrada = [self.contas filteredArrayUsingPredicate:predicate];
    
    if (contaEncontrada.count > 0) {
        return contaEncontrada[0];
    }
    
    return nil;
}

// !!!: Em andamento
/**
 * @discussion Tenta fazer a atualização sem o AFNetworking afim de obter um
 * retorno JSON. Não deu certo ainda. Penso que talves seja possível obter o
 * mesmo resultado com AFNetworking.
 */
- (void)buscaContas {
    /* problemas aqui
     NSURL *contasUrl = [NSURL URLWithString:contasUrlSring];
     
     [[[NSURLSession sharedSession] dataTaskWithURL:contasUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     
     self.contas = (NSMutableArray<Conta> *)[Conta arrayOfModelsFromData:data error:nil];
     [self logContas];
     
     }] resume];
     */
}

/**
 * @discussion Faz uma busca no servidor e atualiza o array contas em caso de sucesso.
 */
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
        [sharedController buscaContas];
    }
    
    return sharedController;
}

#pragma mark - Testes

- (void)logContas {
    // tratando os dados aqui
    for (Conta *c in self.contas) {
        NSLog(@"\nnome: %@", c.Nome);
    }
}

/**
 * @brief Adiciona 3 contas para testes. Testado.
 */
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

/**
 * @discussion A validação já foi feita na viewController, mas será feita uma simples
 * aqui para garantir
 * !!!: Não foi testado ainda.
 * @param conta Um objeto tipo Conta válido.
 * @return Um objeto NSError se houver problema ou nil se estiver tudo certo.
 */
- (NSError<Optional> *)eValida:(Conta *)conta {
    
    NSError *erroNome = [self lengthNome:conta.Nome estaNoRange:NSMakeRange(3, 30)];
    NSError *erroEmail = [self lengthNome:conta.Email estaNoRange:NSMakeRange(6, 20)];
    NSError *erroSenha = [self lengthNome:conta.Senha estaNoRange:NSMakeRange(3, 15)];
    
    NSArray *erros = @[erroNome, erroEmail, erroSenha];
    
    for (NSError *erro in erros) {
        if (erro) {
            return erro;
        }
    }
    
    return nil;
}

/**
 * @discussion Testa se o comprimento de uma string está no intervalo solicitado.
 * @param nome É a string a ser verificada.
 * @param range Contém os valores mínimo e máximo que deve conter o nome.length
 * @return Um objeto NSError ou nil se estiver tudo certo.
 */
- (NSError<Optional> *)lengthNome:(NSString *)nome estaNoRange:(NSRange)range {
    
    if (!nome) {
        return [self errorWithDescription:@"Nome inválido"];
    }
    
    if (nome.length < range.location) {
        return [self errorWithDescription:@"Nome muito curto"];
    }
    
    if (nome.length > range.length) {
        return [self errorWithDescription:@"Nome muito grande"];
    }
    
    return nil;
}

@end
