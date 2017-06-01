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
#import "UIUtils.h"

@implementation ContaController

static NSString *contasUrlSring = @"http://localhost:8080/contas";

#pragma mark - UI Utils

/**
 * @discussion Valida nome, senha e segue para identifier
 * @param nome Caso exista compara senha
 * @param senha Caso seja igual ao registrado segue para a proxima ViewController
 * @param segue Deve estar configurado no storyboard
 * !!!: Não foi testado ainda.
 */
- (void)validarContaComNome:(TextFieldValidator *)nome Senha:(TextFieldValidator *)senha naViewController:(UIViewController *)vc comSegueIdentifier:(NSString *)segue {
    
    if (![self saoValidosOsTextFieldValidator:@[nome, senha]]) {
        [UIUtils alertaOkComMensagem:@"Verifique usuário ou senha" naView:vc];
        return;
    }
    
    Conta *contaExist = [self buscaContaComNome:nome.text];
    
    if (!contaExist) {
        [UIUtils alertaOkComMensagem:@"Conta não existe" naView:vc];
        return;
    }
    
    if (![[contaExist Senha] isEqualToString:senha.text]) {
        [UIUtils alertaOkComMensagem:@"Senha não confere" naView:vc];
        return;
    }
    
    [vc performSegueWithIdentifier:@"seguePost" sender:vc];
}

/**
 * @discussion Adiciona uma conta e emite mensagens na view controller quando necessário
 * @param nome O nome da conta é único
 * @param email O email pode repetir
 * @param senha Deve satisfazer às condições de senha
 * !!!: Não foi testado ainda.
 */
- (void)adicionaContaComNome:(TextFieldValidator *)nome Email:(TextFieldValidator *)email Senha:(TextFieldValidator *)senha naViewController:(UIViewController *)vc {
    
    if (![self saoValidosOsTextFieldValidator:@[nome, email, senha]]) {
        return;
    }
    
    if ([self existeContaComNome:nome.text]) {
        [UIUtils alertaOkComMensagem:@"Nome já existe" naView:vc];
        return;
    }
    
    Conta *conta = [[Conta alloc]
                    initWithNome:nome.text
                    Email:email.text
                    eSenha:senha.text];
    
    NSError *erro = [self adicionar:conta];
    
    if (erro != nil) {
        [UIUtils alertaOkComMensagem:@"Não pude criar a conta" naView:vc];
    }
}


#pragma mark - Getters

/**
 * @discussion Verifica se contas existe. Se não existe cria um e temporariamente adiciona três
 * contas para teste.
 * @return O array contas válido.
 * !!!: Após testes retirar [self addContasTemp].
 */
- (NSMutableArray *)contas {
    
    if (!_contas) {
        _contas = [[NSMutableArray alloc] init];
        [self addContasTemp]; // retirar após testes.
    }
    
    return _contas;
}

#pragma mark - Create

/**
 * @brief Temporariamente a conta será adicionada somente no array
 * !!!: Não foi testado ainda.
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
 * @return Retorna a conta com o nome solicitado, se existir. 
 * Testado.
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


/**
 * @discussion Tenta fazer a atualização sem o AFNetworking afim de obter um
 * retorno JSON. Não deu certo ainda. Penso que talves seja possível obter o
 * mesmo resultado com AFNetworking.
 * !!!: Refazer!
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
 * @discussion Faz uma busca no servidor e atualiza o array contas em caso 
 * de sucesso.
 * !!!: Não foi testado ainda.
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

/**
 * @discussion Verifica se um dos TextFieldValidator no array não é valido.
 * @param textFields É um array de TextFieldValidator que serão analizados.
 * @return Se pelo menos um TextFieldValidator não for válido retorna NO, ou sim caso contrário.
 * !!!: Não foi testado ainda.
 */
- (BOOL)saoValidosOsTextFieldValidator:(NSArray<TextFieldValidator *> *)textFields {
    
    for (TextFieldValidator *tfv in textFields) {
        BOOL valido = [tfv validate];
        NSLog(@"\nO tfv é.... %hhd", valido); // Debug
        if (!valido) {
            return NO;
        }
    }
    
    return YES;
}

/**
 * @discussion Exibe no console os nomes em contas. Apenas para Debug.
 * Não há necessidade de testes.
 */
- (void)logContas {
    // tratando os dados aqui
    for (Conta *c in self.contas) {
        NSLog(@"\nnome: %@", c.Nome);
    }
}

/**
 * @brief Adiciona 3 contas para testes. 
 * Testado.
 */
- (void)addContasTemp {
    NSArray *nomes = @[@"nome1", @"nome2", @"nome3"];
    NSArray *senhas = @[@"000001", @"000002", @"000003"];
    NSArray *emails = @[@"email1@email.com", @"email2@email.com", @"email3@email.com"];
    
    self.contas = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < nomes.count; i++) {
        Conta *conta = [[Conta alloc] initWithNome:nomes[i] Email:emails[i] eSenha:senhas[i]];
        [self.contas addObject:conta];
    }
}

@end
