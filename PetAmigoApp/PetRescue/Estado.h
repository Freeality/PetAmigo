//
//  Estado.h
//  PetRescue
//
//  Created by Pedro Brandão on 05/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//
// {"Capital":"Rio Branco","Estado":"Acre","UF":"AC"}

#import <JSONModel/JSONModel.h>

@interface Estado : JSONModel

@property (nonatomic, assign)NSString *Capital;
@property (nonatomic, retain)NSString *Estado;
@property (nonatomic, retain)NSString *UF;

@end
