//
//  Conta.h
//  PetRescue
//
//  Created by Pedro Brandão on 22/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@protocol Conta
@end

@interface Conta : JSONModel

@property (nonatomic, assign)NSInteger Id;
@property (nonatomic, retain)NSString *Nome;
@property (nonatomic, retain)NSString *Email;
@property (nonatomic, retain)NSString *Senha;

@end
