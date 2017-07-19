//
//  ObjectDAO.h
//  PetRescue
//
//  Created by Pedro Brandão on 16/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Atualizador.h"

@interface ObjectDAO : NSObject

@property (nonatomic, retain)NSMutableArray *all;
@property (nonatomic, retain)UIViewController<AtualizaProtocol> *viewController;
@property (nonatomic, retain)NSString *path;

-(id)initWithPath:(NSString *)path andViewController:(UIViewController<AtualizaProtocol> *)viewController;

@end
