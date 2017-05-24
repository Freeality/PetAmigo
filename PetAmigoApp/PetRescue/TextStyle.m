//
//  h1Style.m
//  PetRescue
//
//  Created by Pedro Brandão on 23/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "TextStyle.h"

@implementation TextStyle

@synthesize font, size;

-(UIFont *)font {
    if (!font) {
        font = [UIFont fontWithName:kFONT size:self.size];
    }
    return font;
}

-(TStyle)size {
    if (size == 0) {
        size = TSyleDefault;
    }
    return size;
}

+(TextStyle *)textStyleWithStyle:(TStyle)style {
    return [[TextStyle alloc] init];
}

@end
