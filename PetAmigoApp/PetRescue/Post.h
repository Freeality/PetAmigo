//
//  Post.h
//  PetRescue
//
//  Created by Pedro Brandão on 02/06/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Local.h"
#import <UIKit/UIKit.h>

@interface Post : JSONModel

@property (nonatomic, retain)Local *local;
@property (nonatomic, retain)UIImage *foto;
@property (nonatomic, retain)NSString *comentario;

@end
