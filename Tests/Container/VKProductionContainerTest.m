//
//  Created by Vitaliy Ruzhnikov on 27.03.12.
//
//
//


#import "VKProductionContainerTest.h"
#import "VKAuthenticator.h"
#import "OxICContainer.h"
#import "VKTestContainer.h"
#import "VKRequestSender.h"
#import "VKProductionContainer.h"
#import "VKLoginScreen.h"
#import "VKLoginViewController.h"
#import "VKErrorNotifier.h"


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
    GHAssertNotNil(authenticator, @"should return authenticator from container");
    GHAssertNotNil(authenticator.serviceAPI, @"property service api should be initialized");
    GHAssertNotNil(authenticator.errorNotifier, @"property error notifier should be initialized");
}

- (void)test_Service_Api_Should_Be_Initialized {
    id <VKRequestSender> serviceAPI = [self.container getObject:@"serviceAPI"];

    GHAssertNotNil(serviceAPI, @"service api should be initialized");
}

- (void)test_Login_Screen_Should_Be_Initialized {
    VKLoginScreen *screen = [self.container getObject:@"loginScreen"];
    GHAssertNotNil(screen, @"login screen should be initialized");
    GHAssertNotNil(screen.authenticator, @"property authenticator should be initialized");
}

- (void)test_Login_View_Controller_Should_Be_Initialized {
    VKLoginViewController *loginViewController = [self.container getObject:@"loginViewController"];
    GHAssertNotNil(loginViewController, @"loginViewController should be initialized");
    GHAssertNotNil(loginViewController.loginScreen, @"property loginScreen should be initialized");
}

- (void)test_Error_Notifier_Should_Be_Initialized {
    id<VKErrorNotifier> errorNotifier = [self.container getObject:@"errorNotifier"];

    GHAssertNotNil(errorNotifier, @"error notifier should be initialized");
}


@end