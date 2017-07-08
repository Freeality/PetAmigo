//
//  Constantes.m
//  PetRescue
//
//  Created by Pedro Brandão on 01/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Constantes.h"

@implementation Constantes

+(NSDictionary *)regexMensagem {
    
    return @{ REGEX_USER_NAME: REGEX_USER_NAME_MSN,
              REGEX_USER_NAME_LIMIT: REGEX_USER_NAME_LIMIT_MSN,
              REGEX_EMAIL: REGEX_EMAIL_MSN,
              REGEX_PASSWORD: REGEX_PASSWORD_MSN,
              REGEX_PASSWORD_LIMIT: REGEX_PASSWORD_LIMIT_MSN };
}

@end
