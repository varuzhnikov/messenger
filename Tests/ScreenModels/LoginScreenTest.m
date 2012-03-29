//
//  Created by Vitaliy Ruzhnikov on 29.03.12.
//
//
//


#import "LoginScreenTest.h"
#import "LoginScreen.h"
#import "OxICContainer.h"
#import "VKTestContainer.h"
#import "OCMockObject.h"
#import "VKAuthenticator.h"


@implementation LoginScreenTest {

}

- (void)setUp {
    [super setUp];
    _loginScreen = [self.container getObject:@"loginScreen"];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_Should_Call_Authenticator_When_User_Enter_With_Login_And_Password_And_Wait {
    id mock = [OCMockObject mockForClass:[VKAuthenticator class]];
    [[mock expect] loginWithUsername:@"username" andPassword:@"password"];
    [_loginScreen enteredLogin:@"username" andPassword:@"password"];
    [mock verify];
//    STAssertTrue(_loginScreen.isWaiting, @"should be waiting status");
}


@end