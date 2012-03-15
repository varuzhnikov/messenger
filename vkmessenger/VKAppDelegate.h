//
//  VKAppDelegate.h
//  vkmessanger
//
//  Created by Виталий on 10.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OxICContainer;

@interface VKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) OxICContainer *container;

@end
