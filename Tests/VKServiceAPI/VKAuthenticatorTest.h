//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>
#import "VKTestContainerTestCase.h"
#import "VKAuthenticatorDelegate.h"

@class VKTestContainer;
@class VKAsyncRequestSender;
@class VKAuthenticator;
@protocol VKErrorNotifier;
@class VKErrorNotifierStub;


@interface VKAuthenticatorTest : VKTestContainerTestCase<VKAuthenticatorDelegate> {
    VKAsyncRequestSender *_serviceAPI;
    VKAuthenticator *_authenticator;
    VKErrorNotifierStub *_errorNotifier;
    BOOL loginFinished;
    BOOL loginFailed;
}


@end