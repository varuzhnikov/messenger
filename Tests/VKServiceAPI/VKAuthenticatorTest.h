//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>

@class VKTestContainer;
@class VKServiceAPIImpl;
@class VKAuthenticator;

@interface VKAuthenticatorTest : SenTestCase {
    VKServiceAPIImpl *_serviceAPI;
    VKAuthenticator *_authenticator;
}

@property(nonatomic, retain) VKTestContainer *container;

@end