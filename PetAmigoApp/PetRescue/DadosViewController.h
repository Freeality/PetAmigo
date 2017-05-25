//
//  DadosViewController.h
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"

@interface DadosViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet TextFieldValidator *nomeField;
@property (weak, nonatomic) IBOutlet TextFieldValidator *senhaField;
@property (weak, nonatomic) IBOutlet TextFieldValidator *emailField;


- (IBAction)goBack:(id *)sender;

- (IBAction)criarConta:(id *)sender;
- (IBAction)entrar:(id *)sender;

@end
