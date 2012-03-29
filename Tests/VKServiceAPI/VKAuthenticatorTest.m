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

    STAssertEqualObjects([_authenticator.serviceAPI token], @"token_from_server", @"should set token after request finished");
}

- (void)test_Authenticator_Should_Notify_Delegate_After_Successful_Login {
    _authenticator.delegate = self;
    [_authenticator loginWithUsername:@"username" andPassword:@"password"];

    STAssertTrue(loginFinished, @"authenticator should notify delegate after successful login");
}

- (void)test_Authenticator_Should_Notify_Error_Notifier_After_Failed_Login {

}

- (void)loginFinished {
    loginFinished = YES;
}


@end