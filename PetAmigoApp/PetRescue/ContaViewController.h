//
//  DadosViewController.h
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"
#import "Pais.h"
#import "Estado.h"
#import "Atualizador.h"

@interface ContaViewController : UIViewController<UITextFieldDelegate, AtualizaProtocol>

@property (weak, nonatomic) IBOutlet TextFieldValidator *nomeField;
@property (weak, nonatomic) IBOutlet TextFieldValidator *senhaField;
@property (weak, nonatomic) IBOutlet TextFieldValidator *emailField;

- (IBAction)criarConta:(id *)sender;
- (IBAction)entrar:(id *)sender;

@end
