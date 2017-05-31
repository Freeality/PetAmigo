//
//  Verificator.m
//  PetRescue
//
//  Created by Pedro Brandão on 25/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "UIUtils.h"

@implementation UIUtils

+ (void)alertaOkComMensagem:(NSString *)mensagem naView:(UIViewController *)viewC {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Tente outra vez"
                                message:mensagem
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                 style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction *action) {
                                                   [alert dismissViewControllerAnimated:YES
                                                                             completion:nil];
                                               }];
    [alert addAction:ok];
    [viewC presentViewController:alert animated:YES completion:nil];
}

@end
