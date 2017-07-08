//
//  UIEffects.m
//  PetRescue
//
//  Created by Pedro Brandão on 20/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "UIEffects.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIEffects

+(void)efeitoBrilhoParaLabel:(UILabel *)label naCor:(UIColor *)cor {
    label.layer.shadowColor = [cor CGColor];
    label.layer.shadowRadius = 4.0f;
    label.layer.shadowOpacity = .9;
    label.layer.shadowOffset = CGSizeZero;
    label.layer.masksToBounds = NO;
}

@end
