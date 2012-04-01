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
#import "VKErrorNotifier.h"
#import "VKErrorNotifierStub.h"
#import "VKTestConstants.h"


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
    _errorNotifier = [self.container getObject:@"errorNotifier"];
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
    [_authenticator loginWithUsername:CORRECT_USERNAME andPassword:CORRECT_PASSWORD];

    STAssertEqualObjects([_authenticator.serviceAPI token], @"token_from_server", @"should set token after request finished");
}

- (void)test_Authenticator_Should_Notify_Delegate_After_Successful_Login {
    _authenticator.delegate = self;
    [_authenticator loginWithUsername:CORRECT_USERNAME andPassword:CORRECT_PASSWORD];

    STAssertTrue(loginFinished, @"authenticator should notify delegate after successful login");
}

- (void)test_Error_Notifier_Property_Should_Be_Initialized {
    STAssertNotNil(_authenticator.errorNotifier, @"error notifier should be initialized");
}

- (void)test_Authenticator_Should_Notify_Error_Notifier_After_Failed_Login {
    [_authenticator loginWithUsername:CORRECT_USERNAME andPassword:WRONG_PASSWORD];

    NSError *lastError = _errorNotifier.lastError;

    STAssertNotNil(lastError, @"should notify error notifier after failed login");
}

- (void)test_Authenticator_Should_Notify_Delegate_About_Failed_Login {
    _authenticator.delegate = self;
    [_authenticator loginWithUsername:CORRECT_USERNAME andPassword:WRONG_PASSWORD];

    STAssertTrue(loginFailed, @"should notify delegate about failed login");
}

- (void)loginFinished {
    loginFinished = YES;
}

- (void)loginFailed {
    loginFailed = YES;
}


@end