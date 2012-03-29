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
    [[authenticatorMock expect] loginWithUsername:@"username" andPassword:@"password"];
    _loginScreen.authenticator = authenticatorMock;

    [_loginScreen enteredLogin:@"username" andPassword:@"password"];
    [authenticatorMock verify];
}

- (void)test_Screen_Delegate_Should_Enter_In_Application_After_Successful_Login {
    [_loginScreen enteredLogin:@"username" andPassword:@"password"];
    STAssertTrue(enteredInApplication, @"screen delegate should enter in application after successful login");
}

- (void)test_Login_Screen_Should_Be_Delegate_Of_Authenticator {
    STAssertNotNil(_loginScreen.authenticator.delegate, @"login screen should be delegate of authenticator");
}

- (void)test_Login_Screen_Should_Start_Waiting_After_Login_Request {
    [_loginScreen enteredLogin:@"username" andPassword:@"wrong_password"];

    STAssertTrue(_loginScreen.isWaiting, @"should be waiting state after login request");
}

- (void)test_Login_Screen_Should_Stop_Waiting_After_Successful_Login {
    [_loginScreen enteredLogin:@"username" andPassword:@"password"];

    STAssertFalse(_loginScreen.isWaiting, @"should stop wait after successful login");
}

- (void)test_Screen_Delegate_Should_Stop_Wait_After_Successful_Login {
    [_loginScreen enteredLogin:@"username" andPassword:@"password"];

    STAssertTrue(stoppedWait, @"screen delegate should stop wait after successful login");
}


- (void)test_Screen_Delegate_Should_Start_Wait_After_Login_Request {
    [_loginScreen enteredLogin:@"username" andPassword:@"password"];

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