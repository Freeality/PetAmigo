//
//  Controller.h
//  PetRescue
//
//  Created by Pedro Brandão on 16/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Atualizador.h"

@interface Controller : NSObject

@property (nonatomic, retain)NSMutableArray *array;
@property (nonatomic, retain)Class classe;
@property (nonatomic, retain)UIViewController<AtualizaProtocol> *viewController;
@property (nonatomic, retain)NSString *path;

-(id)initWithClass:(Class)classe Path:(NSString *)path andViewController:(UIViewController<AtualizaProtocol> *)viewController;

@end
