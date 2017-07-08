//
//  Verificator.h
//  PetRescue
//
//  Created by Pedro Brandão on 25/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"
#import <JSONModel.h>

@interface UIUtils : NSObject

+ (void)alertaOkComMensagem:(NSString *)mensagem eTitulo:(NSString *)titulo naView:(UIViewController *)viewC;
+ (BOOL)saoValidosOsTextFieldValidator:(NSArray<TextFieldValidator *> *)textFields;
+ (NSMutableArray *)converteResponse:(id)response comJSONModelClass:(Class)classe;
+ (UIAlertController *)espere;

@end
