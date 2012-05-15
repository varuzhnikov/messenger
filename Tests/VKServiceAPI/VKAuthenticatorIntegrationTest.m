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
    _requestSender = [self.container getObject:@"requestSender"];
    _authenticator.delegate = self;
}

- (void)tearDown {
    [super tearDown];
    [_request release];
}

- (void)test_Should_Get_Access_Token_From_Server {
    [self prepare];
    
    [_authenticator loginWithUsername:@"denis.tarazanov@gmail.com" andPassword:@"_Gu^iL@D"];
    
    // Wait for notify
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
    
    NSLog(@"Login finished");
    NSLog(@"serviceAPI token %@, ", _requestSender.token);
    GHAssertTrue(_requestSender.token.length > 0, @"should get nonempty token from server");
}

- (void)test_Should_Failed_Login_With_Wrong_Requisites {
    [self prepare];
    
    [_authenticator loginWithUsername:CORRECT_USERNAME andPassword:WRONG_PASSWORD];
    
    // Wait for notify
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
    
    NSLog(@"Login failed");
    GHAssertNil(_requestSender.token, @"token should be nil after failed login");
}

- (void)loginFinished {
    // Notify the wait. Notice the forSelector points to the test above. 
    // This is so that stray notifies don't error or falsely succeed other tests.
    // To ignore the check, forSelector can be NULL.
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(test_Should_Get_Access_Token_From_Server)];
}

- (void)loginFailed {
    // Notify the wait. Notice the forSelector points to the test above. 
    // This is so that stray notifies don't error or falsely succeed other tests.
    // To ignore the check, forSelector can be NULL.
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(test_Should_Failed_Login_With_Wrong_Requisites )];
}


@end