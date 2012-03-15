//
//  OxICSimpleClassWrapper.h
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 18/07/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICClassWrapper.h"

@interface OxICSimpleClassWrapper : NSObject<OxICClassWrapper> {
	Class type;
}

- (id) initWithClass:(Class) aType;

- (id) initWithClassName:(NSString*) aClassName;

@end
