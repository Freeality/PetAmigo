//
//  Pais.h
//  PetRescue
//
//  Created by Pedro Brandão on 05/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//
// {"CodigoArea":"93","Pais":"Afeganistão","Sigla":"AF"}

#import <JSONModel/JSONModel.h>

@interface Pais : JSONModel

@property (nonatomic, assign)NSString *CodigoArea;
@property (nonatomic, retain)NSString *Pais;
@property (nonatomic, retain)NSString *Sigla;

@end
