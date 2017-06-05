//
//  Pais.h
//  PetRescue
//
//  Created by Pedro Brandão on 05/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Pais : JSONModel

@property (nonatomic, assign)NSInteger Id;
@property (nonatomic, retain)NSString *codigoISO;
@property (nonatomic, retain)NSString *nome;
@property (nonatomic, retain)NSString *sigla;

@end
