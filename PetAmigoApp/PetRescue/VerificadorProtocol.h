//
//  Verificavel.h
//  PetRescue
//
//  Created by Pedro Brandão on 25/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"

@protocol Verificador <NSObject>

- (BOOL)verificarTextField:(TextFieldValidator *)textField NaView:(UIViewController *)viewC;

@end
