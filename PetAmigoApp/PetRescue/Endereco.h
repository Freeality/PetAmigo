//
//  Endereco.h
//  PetRescue
//
//  Created by Pedro Brandão on 02/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Conta.h"
#import "Pais.h"
#import "Estado.h"
#import "Cidade.h"

@interface Endereco : JSONModel

@property (nonatomic, assign)NSInteger Id;
@property (nonatomic, retain)NSString *rua;
@property (nonatomic, retain)Cidade *cidade;
@property (nonatomic, retain)Estado *estado;
@property (nonatomic, retain)Pais *paisId;

@end
