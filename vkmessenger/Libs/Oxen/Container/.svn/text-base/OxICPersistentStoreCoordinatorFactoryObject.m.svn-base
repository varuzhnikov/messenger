//
//  OxICPersistentStoreCoordinatorFactoryObject.m
//  OXENIPHONECOMMONS
//
//  Created by Lautaro Brasseur on 04/08/11.
//  Copyright 2011 Oxen Software Studio. All rights reserved.
//

#import "OxICPersistentStoreCoordinatorFactoryObject.h"


@implementation OxICPersistentStoreCoordinatorFactoryObject
@synthesize storeUrl, managedObjectModel;

- (void) dealloc {
	self.storeUrl = nil;
	self.managedObjectModel = nil;
	[super dealloc];
}

- (id) getObject {
	NSError *error = nil;
	NSPersistentStoreCoordinator* persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
																initWithManagedObjectModel:self.managedObjectModel];
	
	if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
												 configuration:nil
														   URL:self.storeUrl
													   options:nil
														 error:&error]) {
		[NSException raise:@"NSPersistentStoreCoordinatorException"
					format:@"Error creating persisten store coordinator. Domain:%@ Code:%d", [error domain], [error code]];
	}
	
	return [persistentStoreCoordinator autorelease];
}

@end
