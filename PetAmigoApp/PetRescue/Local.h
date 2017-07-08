//
//  Local.h
//  PetRescue
//
//  Created by Pedro Brandão on 08/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Endereco.h"

@interface Local : NSObject

@property (assign) CLLocationCoordinate2D coordenada;
@property (nonatomic, retain) Endereco *endereco;

@end
