//
//  h1Style.h
//  PetRescue
//
//  Created by Pedro Brandão on 23/05/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kFONT @"Futura"

typedef NS_ENUM(NSInteger, TStyle) {
    TSyleDefault = 17,
    TSyleH1 = 25,
    TSyleH2 = 20,
    TSyleH3 = 14
};

@interface TextStyle : NSObject

@property (nonatomic, retain) UIFont *font;
@property (nonatomic, assign) TStyle size;

+(TextStyle *)textStyleWithStyle:(TStyle)style;

@end
