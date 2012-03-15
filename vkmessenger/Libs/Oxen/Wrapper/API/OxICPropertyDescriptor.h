//
//  OxICPropertyDescriptor.h
//  OxeniPhoneCommons
//
//  Created by Lautaro Brasseur on 19/07/10.
//  Copyright 2010 Oxen Software Studio. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OxICPropertyDescriptor : NSObject {
	NSString *name;
	Class type;
	Protocol *protocol;
}


- (id) initWithName:(NSString*)aName
			andType:(Class)aType
		andProtocol:(Protocol*)aProtocol;

- (NSString*) name;
- (Class) type;
- (Protocol*) protocol;

@end
