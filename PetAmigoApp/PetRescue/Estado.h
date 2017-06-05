//
//  Estado.h
//  PetRescue
//
//  Created by Pedro Brandão on 05/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Estado : JSONModel

@property (nonatomic, assign)NSInteger *Id;
@property (nonatomic, retain)NSString *nome;
@property (nonatomic, retain)NSString *sigla;
@property (nonatomic, assign)NSInteger idPais;

@end
