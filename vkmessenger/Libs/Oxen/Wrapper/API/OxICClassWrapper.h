//
//  OxICClassWrapper.h
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 18/07/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OxICPropertyDescriptor.h"

@protocol OxICClassWrapper

/**
 * Gets the property descriptors.
 * 
 * @return An array with the descriptors of the properties
 */
- (NSArray*) getPropertyDescriptors;

/**
 * Gets the property descriptor.
 * 
 * @param propertyName
 *            The property
 * @return A property descriptor
 */
- (OxICPropertyDescriptor*) getPropertyDescriptor: (NSString*) propertyName;

/**
 * Determines if a property exists.
 * 
 * @param propertyName
 *            The property name
 * @return Treu if the property exists
 */
- (BOOL) hasProperty:(NSString*) propertyName;

/**
 * Creates a new object. Also calls the init method.
 * @return The new object
 */
- (id) newObject;

/**
 * Creates a new object. Doesn't call the init method.
 * @return The new object
 */
- (id) allocObject;

/**
 * Indicates if the wrapepd class conforms to a given protocol..
 * @return True if the class conforms
 */
- (BOOL) conformsToProtocol: (Protocol*) protocol;

@end
