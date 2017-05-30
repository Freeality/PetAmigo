//
//  Controller.h
//  PetRescue
//
//  Created by Pedro Brandão on 25/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ERRO101 @"Conta inválida"

@interface Controller : NSObject

- (NSError *)errorWithDescription:(NSString *)desc;

@end

typedef NS_ENUM(NSInteger, Erro) {
    ErroContaInvalida = 101
};
