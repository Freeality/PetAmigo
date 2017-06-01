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

@end
