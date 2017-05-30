//
//  Controller.m
//  PetRescue
//
//  Created by Pedro Brandão on 25/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Controller.h"

NSString *domain = @"br.com.freeality.PetAmigo.Controller";

@implementation Controller

-(NSError *)errorWithDescription:(NSString *)desc {
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : desc };
    return [NSError errorWithDomain:domain code:-101 userInfo:userInfo];
}

@end
