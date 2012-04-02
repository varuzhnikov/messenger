//
//  Created by Vitaliy Ruzhnikov on 12.03.12.
//
//
//


#import "VKAuthenticatorIntegrationTest.h"
#import "ASIHTTPRequest.h"
#import "VKAsyncRequestSender.h"
#import "VKLoginRequest.h"
#import "VKAuthenticator.h"
#import "OxICContainer.h"
#import "VKProductionContainer.h"
#import "VKTestConstants.h"
#import "VKIntegrationTestContainer.h"


@implementation VKAuthenticatorIntegrationTest {

}

- (void)setUp {
    [super setUp];
    _authenticator = [self.container getObject:@"authenticator"];
    _authenticator.errorNotifier = nil;
    _serviceAPI = [self.container getObject:@"serviceAPI"];
    _authenticator.delegate = self;
}

- (void)tearDown {
    [super tearDown];
    [_request release];
}

- (void)test_Should_Get_Access_Token_From_Server {
    [_authenticator loginWithUsername:@"denis.tarazanov@gmail.com" andPassword:@"_Gu^iL@D"];
}

- (void)test_Should_Failed_Login_With_Wrong_Requisites {

    [_authenticator loginWithUsername:CORRECT_USERNAME andPassword:WRONG_PASSWORD];
}

- (void)loginFinished {
    NSLog(@"Login finished");
    NSLog(@"serviceAPI token %@, ", _serviceAPI.token);
    GHAssertTrue(_serviceAPI.token.length > 0, @"should get nonempty token from server");
}

- (void)loginFailed {
    NSLog(@"Login failed");
    GHAssertNil(_serviceAPI.token, @"token should be nil after failed login");
}


@end