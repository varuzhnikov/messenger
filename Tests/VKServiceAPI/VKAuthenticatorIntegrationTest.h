//
//  Created by Vitaliy Ruzhnikov on 12.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHAsyncTestCase.h>
#import "VKRequestDelegate.h"
#import "VKAsyncTestCase.h"
#import "VKAuthenticatorDelegate.h"

@class ASIHTTPRequest;
@class VKAuthenticator;
@protocol VKRequestSender;
@class VKErrorNotifierStub;


@interface VKAuthenticatorIntegrationTest : VKAsyncTestCase<VKAuthenticatorDelegate>  {
    VKRequest *_request;

    VKAuthenticator *_authenticator;
    id<VKRequestSender> _serviceAPI;
}

@end