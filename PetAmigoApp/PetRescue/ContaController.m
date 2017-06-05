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
#import "Constantes.h"

@implementation ContaController

static NSString *contasUrlSring = @"http://localhost:8080/contas";

#pragma mark - UI Utils

/**
 * @discussion Valida nome, senha e segue para identifier
 * @param nome Caso exista compara senha
 * @param senha Caso seja igual ao registrado segue para a proxima ViewController
 * @param segue Deve estar configurado no storyboard
 */
- (void)validarContaComNome:(TextFieldValidator *)nome Senha:(TextFieldValidator *)senha naViewController:(UIViewController *)vc comSegueIdentifier:(NSString *)segue {
    
    if (![self saoValidosOsTextFieldValidator:@[nome, senha]]) {
        [UIUtils alertaOkComMensagem:VERIFIQUE_TEXT eTitulo:TENTE_TEXT naView:vc];
        return;
    }
    
    Conta *contaExist = [self buscaContaComNome:nome.text];
    
    if (!contaExist) {
        [UIUtils alertaOkComMensagem:CONTA_INEXISTE eTitulo:TENTE_TEXT naView:vc];
        return;
    }
    
    if (![[contaExist Senha] isEqualToString:senha.text]) {
        [UIUtils alertaOkComMensagem:SENHA_NAO eTitulo:TENTE_TEXT naView:vc];
        return;
    }
    
    [vc performSegueWithIdentifier:SEGUE_POST sender:vc];
}

/**
 * @discussion Adiciona uma conta e emite mensagens na view controller quando necessário
 * @param nome O nome da conta é único
 * @param email O email deve ser único
 * @param senha Deve satisfazer às condições de senha
 */
- (void)adicionaContaComNome:(TextFieldValidator *)nome Email:(TextFieldValidator *)email Senha:(TextFieldValidator *)senha naViewController:(UIViewController *)vc {
    
    if (![self saoValidosOsTextFieldValidator:@[nome, email, senha]]) {
        [UIUtils alertaOkComMensagem:VERIFIQUE_TEXT eTitulo:TENTE_TEXT naView:vc];
        return;
    }
    
    if ([self existeContaComNome:nome.text]) {
        [UIUtils alertaOkComMensagem:NOME_EXISTE eTitulo:TENTE_TEXT naView:vc];
        return;
    }
    
    if ([self existeContaComEmail:email.text]) {
        [UIUtils alertaOkComMensagem:EMAIL_EXISTE eTitulo:TENTE_TEXT naView:vc];
        return;
    }
    
    Conta *conta = [[Conta alloc]
                    initWithNome:nome.text
                    Email:email.text
                    eSenha:senha.text];
    
    NSError *erro = [self adicionar:conta];
    
    if (erro != nil) {
        [UIUtils alertaOkComMensagem:NAO_PUDE_CRIAR eTitulo:TENTE_TEXT naView:vc];
        return;
    }
    
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
                                      [vc performSegueWithIdentifier:SEGUE_POST sender:vc];
                                  }];
    [alert addAction:alertAction];
    [vc presentViewController:alert animated:YES completion:nil];
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
 * @brief Temporariamente a conta será adicionada somente no array. Os dados foram verificados
 * na ViewController. Esse método não verifica a validade da conta.
 * !!!: Falta implementar com servidor
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
 */
- (BOOL)existeContaComNome:(NSString *)nome {
    Conta *conta = [self buscaContaComNome:nome];
    
    if (conta) {
        return YES;
    }
    
    return NO;
}

- (BOOL)existeContaComEmail:(NSString *)email {
    Conta *conta = [self buscaContaComEmail:email];
    
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
    
    Conta *conta = [self buscaContaPorCampo:NOME_FIELD comChave:nome];
    
    if (conta) {
        return conta;
    }
    
    return nil;
}

- (Conta<Optional> *)buscaContaComEmail:(NSString *)email {
    
    Conta *conta = [self buscaContaPorCampo:EMAIL_FIELD comChave:email];
    
    if (conta) {
        return conta;
    }
    
    return nil;
}

- (Conta<Optional> *)buscaContaPorCampo:(NSString *)campo comChave:(NSString *)chave {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:FILTER_MATCHES, campo, chave];
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
 * !!!: Testar com servidor
 */
- (void)AFbuscaContas {
    NSDictionary *param = @{@"id": @1};
    NSURL *contasUrl = [NSURL URLWithString:contasUrlSring];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:contasUrl.absoluteString parameters:param progress:^(NSProgress * downloadProgress) {
        // progresso aqui
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        // sucesso aqui
        self.contas = (NSMutableArray<Conta *> *)[Conta arrayOfModelsFromDictionaries:responseObject error:nil];
        
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
        [self adicionar:conta];
    }
}

@end
