//
//  Verificator.m
//  PetRescue
//
//  Created by Pedro Brandão on 25/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "UIUtils.h"
#import "Constantes.h"

@implementation UIUtils

+ (void)alertaOkComMensagem:(NSString *)mensagem eTitulo:(NSString *)titulo naView:(UIViewController *)viewC {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:titulo
                                message:mensagem
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:OK_BUTTON
                                                 style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction *action) {
                                                   [alert dismissViewControllerAnimated:YES
                                                                             completion:nil];
                                               }];
    [alert addAction:ok];
    [viewC presentViewController:alert animated:YES completion:nil];
}

+ (UIAlertController *)espere {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:[NSString stringWithFormat:@"%@\n\n\n", ESPERE_TEXT]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(130.5, 65.5);
    spinner.color = [UIColor blackColor];
    [spinner startAnimating];
    [alert.view addSubview:spinner];
    return alert;
}

/**
 * @discussion Verifica se um dos TextFieldValidator no array não é valido.
 * @param textFields É um array de TextFieldValidator que serão analizados.
 * @return Se pelo menos um TextFieldValidator não for válido retorna NO, ou sim caso contrário.
 */
+ (BOOL)saoValidosOsTextFieldValidator:(NSArray<TextFieldValidator *> *)textFields {
    
    for (TextFieldValidator *tfv in textFields) {
        BOOL valido = [tfv validate];
        if (!valido) {
            return NO;
        }
    }
    
    return YES;
}

+ (NSMutableArray *)converteResponse:(id)response comJSONModelClass:(Class)classe {
    
    if ([response count] > 0) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (NSDictionary *object in response) {
            NSError *err = nil;
            JSONModel *model = [[classe alloc] initWithDictionary:object error:&err];
            
            if (!err) {
                [array addObject:model];
            } else {
                NSLog(@"\n\nErro tentando converter JSON... %@", err.localizedDescription);
            }
        }
        return array;
    }
    return nil;
}

@end
