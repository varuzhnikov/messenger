//
//  Created by Vitaliy Ruzhnikov on 06.04.12.
//
//
//


#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHAsyncTestCase.h>
#import "VKAsyncTestCase.h"
#import "VKContactsRetrieverDelegate.h"
#import "VKAuthenticatorDelegate.h"

@class VKContactsRetriever;
@class VKAuthenticator;

@interface VKContactsRetrieverIntegrationTest : VKAsyncTestCase <VKContactsRetrieverDelegate, VKAuthenticatorDelegate> {
    VKContactsRetriever *_contactsRetriever;
    VKAuthenticator *_authenticator;
}
@end