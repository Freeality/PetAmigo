//
//  Endereco.h
//  PetRescue
//
//  Created by Pedro Brandão on 02/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Conta.h"

@interface Endereco : JSONModel

@property (nonatomic, assign)NSInteger Id;
@property (nonatomic, retain)NSString *rua;
@property (nonatomic, retain)NSString *cidade;
@property (nonatomic, retain)NSString *estado;
@property (nonatomic, retain)NSString *cep;
@property (nonatomic, retain)NSString *pais;
@property (nonatomic, retain)NSString *paisCodigoISO;

@end
