//
//  OxICNibFactoryObject.m
//  OXENIPHONECOMMONS
//
//  Created by Lautaro Brasseur on 03/08/11.
//  Copyright 2011 Oxen Software Studio. All rights reserved.
//

#import "OxICNibFactoryObject.h"
#import <UIKit/UIKit.h>

@implementation OxICNibFactoryObject
@synthesize name, owner;

- (void) dealloc {
	self.name = nil;
	self.owner = nil;
	[super dealloc];
}


- (BOOL) iPad {
	BOOL iPad = FALSE;
	
#ifdef UI_USER_INTERFACE_IDIOM
	iPad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
#endif
	
	return iPad;
}

- (id) getObject {
	NSArray* nibViews = nil;
	
	if ([self iPad]) {
		nibViews = [[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"%@-iPad", self.name]
												 owner:self.owner
											   options:nil];
	}
	
	if (nibViews == nil || [nibViews count] == 0) {
		nibViews = [[NSBundle mainBundle] loadNibNamed:self.name
												 owner:self.owner
											   options:nil];
	}
	
	return [nibViews objectAtIndex: 0];	
}

@end
