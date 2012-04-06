//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>
#import "VKUnitTestContainerTestCase.h"
#import "VKAuthenticatorDelegate.h"

@class VKUnitTestContainer;
@class VKAsyncRequestSender;
@class VKAuthenticator;
@protocol VKErrorNotifier;
@class VKErrorNotifierStub;


@interface VKAuthenticatorTest : VKUnitTestContainerTestCase <VKAuthenticatorDelegate> {
    VKAsyncRequestSender *_requestsSender;
    VKAuthenticator *_authenticator;
    VKErrorNotifierStub *_errorNotifier;
    BOOL loginFinished;
    BOOL loginFailed;
}


@end