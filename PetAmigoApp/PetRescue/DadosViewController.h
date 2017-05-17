//
//  DadosViewController.h
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "emailTextField.h"

@interface DadosViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *senha;
@property (weak, nonatomic) IBOutlet emailTextField *email;

- (IBAction)goBack:(id *)sender;

- (IBAction)criarConta:(id *)sender;
- (IBAction)entrar:(id *)sender;

@end
