//
//  OxICObjectWrapper.h
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 18/07/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OxICClassWrapper.h"

@protocol OxICObjectWrapper<OxICClassWrapper>
/**
 * Gets a property from a bean.
 * 
 * @param name
 *            The property
 * @return The property value
 */
- (id) getProperty: (NSString*) name;

/**
 * Sets a property to a bean.
 * 
 * @param name
 *            The property
 * @param value
 *            The property value
 */
- (void) setProperty: (NSString*)name withValue: (id)value;

/**
 * Gets the wrapped object.
 * @return The wrapped object
 */
- (id) getObject;

@end
