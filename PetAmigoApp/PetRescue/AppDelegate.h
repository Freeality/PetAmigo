//
//  AppDelegate.h
//  PetRescue
//
//  Created by Pedro Brandão on 21/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

