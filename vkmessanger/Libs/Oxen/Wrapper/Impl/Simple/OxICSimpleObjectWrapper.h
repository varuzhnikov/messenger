//
//  LFCObjectWrapper.h
//  Otra
//
//  Created by Lautaro Brasseur on 15/12/09.
//  Copyright 2009 na. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OxICObjectWrapper.h"
#import "OxICSimpleClassWrapper.h"

@interface OxICSimpleObjectWrapper : OxICSimpleClassWrapper<OxICObjectWrapper> {
	id object;
}

- (id) initWithObject:(id) anObject;
- (id) initWithClassName:(NSString*) aClassName;

@end
