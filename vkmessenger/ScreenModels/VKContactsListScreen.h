//
//  Created by Vitaliy Ruzhnikov on 30.04.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKContactsRetrieverDelegate.h"

@class VKContactsRetriever;
@class VKContact;

@interface VKContactsListScreen : NSObject <VKContactsRetrieverDelegate>

@property(nonatomic, retain) VKContactsRetriever *contactsRetriever;

- (void)startDownloading;

- (NSUInteger)contactsCount;

- (VKContact *)objectAtIndexPath:(NSIndexPath *)path;
@end