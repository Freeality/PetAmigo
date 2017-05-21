//
//  KeyboardViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 17/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()

@end

@implementation KeyboardViewController

- (void) registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(keyboardWillBeHidden:)
                                                 name: UIKeyboardWillHideNotification object: nil];
    
}

// Chamado quando o UIKeyboardDidShowNotification é enviado.
- (void) keyboardWasShown: (NSNotification *) aNotification
{
    NSDictionary * info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey: UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // Se o campo de texto ativo estiver oculto pelo teclado, role-o para que fique visível
    // Seu aplicativo pode não precisar ou querer esse comportamento.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin)) {
        [self.scrollView scrollRectToVisible: self.activeField.frame animated: YES];
    }
}

// Chamado quando o UIKeyboardWillHideNotification é enviado
- (void) keyboardWillBeHidden: (NSNotification *) aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

@end
