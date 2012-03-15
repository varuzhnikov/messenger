//
//  OxICWrapperFactory.h
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 18/07/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OxICClassWrapper.h"
#import "OxICObjectWrapper.h"

@protocol OxICWrapperFactory<NSObject>
/**
 * Wraps a class
 * @param className
 *            The class to be wrapped
 * @return The ClassWrapper which wraps the class
 */
- (id<OxICClassWrapper>) wrapClass: (NSString*)className;

/**
 * Wraps a object
 * @param object
 *            The object to be wrapped
 * @return The BeanWrapper which wraps the bean
 */
- (id<OxICObjectWrapper>) wrapObject: (id) object;

/**
 * Instantiates and wraps a bean
 * @param className
 *            The the name of the class of the object to be wrapped
 * @return The BeanWrapper which wraps the bean
 */
- (id<OxICObjectWrapper>) createAndWrapObject: (NSString*)className;

@end
