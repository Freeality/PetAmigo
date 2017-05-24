//
//  EncontreiTableViewController.h
//  PetRescue
//
//  Created by Pedro Brandão on 22/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EncontreiTableViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *rua;
@property (weak, nonatomic) IBOutlet UITextField *complemento;
@property (weak, nonatomic) IBOutlet UITextField *cidade;
@property (weak, nonatomic) IBOutlet UITextField *estado;
@property (weak, nonatomic) IBOutlet UITextField *cep;
@property (weak, nonatomic) IBOutlet UITextView *comentario;

- (IBAction)goBack:(id)sender;
- (IBAction)done:(id)sender;

@end
