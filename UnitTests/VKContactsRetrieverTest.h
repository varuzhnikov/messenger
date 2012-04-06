//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKUnitTestContainerTestCase.h"
#import "VKContactsRetrieverDelegate.h"

@class VKContactsRetriever;
@protocol VKErrorNotifier;
@class VKErrorNotifierStub;
@protocol VKRequestSender;


@interface VKContactsRetrieverTest : VKUnitTestContainerTestCase<VKContactsRetrieverDelegate> {
    VKContactsRetriever* retriever;
    BOOL contactsRetrieved;
    VKErrorNotifierStub * _errorNotifier;
    id<VKRequestSender> _requestSender;
}

@end