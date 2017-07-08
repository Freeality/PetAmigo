//
//  Verificador.h
//  PetRescue
//
//  Created by Pedro Brandão on 07/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Verificador : NSObject

+ (NSError *)validaCampo:(NSString *)campo comString:(NSString *)string eRegexDictionary:(NSDictionary *)regexDict;

@end
