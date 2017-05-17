//
//  ContaController.h
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conta.h"

@interface ContaController : NSObject

@property (strong, nonatomic) NSMutableArray<Conta, Optional> *contas;

+ (ContaController *)sharedController;

@end
