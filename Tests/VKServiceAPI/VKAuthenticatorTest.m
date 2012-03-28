//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import "VKAuthenticatorTest.h"
#import "VKTestContainer.h"
#import "VKServiceAPIImpl.h"
#import "VKAuthenticator.h"
#import "VKRequest.h"


@implementation VKAuthenticatorTest {

@private
    VKTestContainer *_container;
}
@synthesize container = _container;




- (void)setUp {
    [super setUp];
    _container = [[VKTestContainer alloc] init];
    _authenticator = [self.container getObject:@"authenticator"];
    _serviceAPI = [self.container getObject:@"serviceAPI"];
}

- (void)tearDown {
    self.container = nil;
    [super tearDown];

}

- (void)test_Service_Api_Should_Get_Empty_Token_After_Failed_Login {
    [_authenticator loginWithUsername:@"" andPassword:@""];
    STAssertEqualObjects(_serviceAPI.token, @"", @"service api should get empty token if login failed");
}

- (void)test_Authenticator_Should_Set_Token_After_Request_Finished {
    [_authenticator loginWithUsername:@"username" andPassword:@"password"];

    STAssertNotNil(_authenticator.serviceAPI, @"service api should not be nil");
    STAssertEqualObjects([_authenticator.serviceAPI token], @"token", @"should set token after request finished");
}


@end