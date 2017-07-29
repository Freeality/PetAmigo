//
//  ContaServices.h
//  PetRescue
//
//  Created by Pedro Brandão on 14/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContaViewController.h"
#import "Conta.h"

@interface ContaController : NSObject

@property (nonatomic, retain)ContaViewController *contaVC;
@property (nonatomic, retain)NSUserDefaults *defaults;

- (void)adiciona;
- (void)autentica;

+ (ContaController *)sharedController;

@end
