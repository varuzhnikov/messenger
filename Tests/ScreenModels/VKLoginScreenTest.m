//
//  Created by Vitaliy Ruzhnikov on 29.03.12.
//
//
//


#import "VKLoginScreenTest.h"
#import "VKLoginScreen.h"
#import "OxICContainer.h"
#import "VKTestContainer.h"
#import "OCMockObject.h"
#import "VKAuthenticator.h"
#import "VKTestConstants.h"


@implementation VKLoginScreenTest {

}

- (void)setUp {
    [super setUp];
    _loginScreen = [self.container getObject:@"loginScreen"];
    _loginScreen.delegate = self;
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_Should_Call_Authenticator_When_User_Enter_With_Login_And_Password_And_Wait {
    id authenticatorMock = [OCMockObject niceMockForClass:[VKAuthenticator class]];
    [[authenticatorMock expect] loginWithUsername:CORRECT_USERNAME andPassword:CORRECT_PASSWORD];
    _loginScreen.authenticator = authenticatorMock;

    [_loginScreen enteredLogin:CORRECT_USERNAME andPassword:CORRECT_PASSWORD];
    [authenticatorMock verify];
}

- (void)test_Screen_Delegate_Should_Enter_In_Application_After_Successful_Login {
    [_loginScreen enteredLogin:CORRECT_USERNAME andPassword:CORRECT_PASSWORD];
    STAssertTrue(enteredInApplication, @"screen delegate should enter in application after successful login");
}

- (void)test_Login_Screen_Should_Be_Delegate_Of_Authenticator {
    STAssertNotNil(_loginScreen.authenticator.delegate, @"login screen should be delegate of authenticator");
}

- (void)test_Login_Screen_Should_Start_Waiting_After_Login_Request {
    _loginScreen.authenticator = nil;
    [_loginScreen enteredLogin:CORRECT_USERNAME andPassword:CORRECT_PASSWORD];

    STAssertTrue(_loginScreen.isWaiting, @"should be waiting state after login request");
}

- (void)test_Login_Screen_Should_Stop_Waiting_After_Successful_Login {
    [_loginScreen enteredLogin:CORRECT_USERNAME andPassword:CORRECT_PASSWORD];

    STAssertFalse(_loginScreen.isWaiting, @"should stop wait after successful login");
}

- (void)test_Login_Screen_Should_Stop_Waiting_After_Error_In_Response {
    [_loginScreen enteredLogin:CORRECT_USERNAME andPassword:WRONG_PASSWORD];

    STAssertFalse(_loginScreen.isWaiting, @"should stop wait after successful login");
}

- (void)test_Screen_Delegate_Should_Stop_Wait_After_Successful_Login {
    [_loginScreen enteredLogin:CORRECT_USERNAME andPassword:CORRECT_PASSWORD];

    STAssertTrue(stoppedWait, @"screen delegate should stop wait after successful login");
}


- (void)test_Screen_Delegate_Should_Start_Wait_After_Login_Request {
    [_loginScreen enteredLogin:CORRECT_USERNAME andPassword:CORRECT_PASSWORD];

    STAssertTrue(startedWait, @"screen delegate should start wait after login request");
}

- (void)enterInApplication {
    enteredInApplication = YES;
}

- (void)stopWait {
    stoppedWait = YES;
}

- (void)startWait {
    startedWait = YES;
}


@end