//
//  NomeTextFieldValidator.h
//  PetRescue
//
//  Created by Pedro Brandão on 25/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "TextFieldValidator.h"
#import "VerificadorProtocol.h"
#import "Verificator.h"

@interface NomeTextFieldVerificator : Verificator<Verificador>

+(NomeTextFieldVerificator *)sharedVerificator;

@end
