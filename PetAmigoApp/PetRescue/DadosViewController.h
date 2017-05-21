//
//  DadosViewController.h
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DadosViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nomeField;


- (IBAction)goBack:(id *)sender;

- (IBAction)criarConta:(id *)sender;
- (IBAction)entrar:(id *)sender;

@end
