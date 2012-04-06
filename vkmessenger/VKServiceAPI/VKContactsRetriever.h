//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKRequestDelegate.h"

@protocol VKRequestSender;
@protocol VKContactsRetrieverDelegate;
@protocol VKErrorNotifier;


@interface VKContactsRetriever : NSObject<VKRequestDelegate>

@property(nonatomic, retain) id <VKRequestSender> requestSender;

@property(nonatomic, retain) NSArray * contacts;

@property(nonatomic, retain) id<VKContactsRetrieverDelegate> delegate;

@property(nonatomic, retain) id <VKErrorNotifier> errorNotifier;

@property(nonatomic, retain) VKRequest *request;



- (void)retrieveContacts;
@end