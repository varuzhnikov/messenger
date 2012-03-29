//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import "VKProductionContainerTest.h"
#import "VKAuthenticator.h"
#import "OxICContainer.h"
#import "VKTestContainer.h"
#import "VKServiceAPI.h"
#import "VKProductionContainer.h"
#import "VKLoginScreen.h"
#import "VKLoginViewController.h"


@implementation VKProductionContainerTest {

}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}


- (void)test_Authenticator_Should_Be_Initialized {
    VKAuthenticator *authenticator = [self.container getObject:@"authenticator"];//String initialization.
    STAssertNotNil(authenticator, @"should return authenticator from container");
    STAssertNotNil(authenticator.serviceAPI, @"property service api should be initialized");
}

- (void)test_Service_Api_Should_Be_Initialized {
    id <VKServiceAPI> serviceAPI = [self.container getObject:@"serviceAPI"];

    STAssertNotNil(serviceAPI, @"service api should be initialized");
}

- (void)test_Login_Screen_Should_Be_Initialized {
    VKLoginScreen *screen = [self.container getObject:@"loginScreen"];
    STAssertNotNil(screen, @"login screen should be initialized");
    STAssertNotNil(screen.authenticator, @"property authenticator should be initialized");
}

- (void)test_Login_View_Controller_Should_Be_Initialized {
    VKLoginViewController *loginViewController = [self.container getObject:@"loginViewController"];
    STAssertNotNil(loginViewController, @"loginViewController should be initialized");
    STAssertNotNil(loginViewController.loginScreen, @"property loginScreen should be initialized");
}


@end