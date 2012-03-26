//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import "VKAuthenticator.h"
#import "OxICContainer.h"
#import "VKServiceAPIImpl.h"
#import "VKRequest.h"
#import "VKServiceAPI.h"
#import "VKLoginRequest.h"


@implementation VKAuthenticator {
@private
    id _serviceAPI;
    id<VKRequestFactory> _requestFactory;
    VKRequest *_loginRequest;
}

IoCName(authenticator)
IoCSingleton
IoCLazy
IoCInject(serviceAPI, serviceAPI)
@synthesize serviceAPI = _serviceAPI;

IoCInject(requestFactory, requestFactory)
@synthesize requestFactory = _requestFactory;
@synthesize loginRequest = _loginRequest;


- (void)requestFailed:(VKRequest *)request {

}

- (void)requestFinished:(VKRequest *)request {
    VKLoginRequest *loginRequest = (VKLoginRequest *)request;

    self.serviceAPI.token = loginRequest.token;

    self.loginRequest = nil;
}

- (void)dealloc {
    self.serviceAPI = nil;
    self.requestFactory = nil;
    self.loginRequest = nil;
    [super dealloc];
}


- (void)loginWithUsername:(NSString *)userName andPassword:(NSString *)password {
    self.loginRequest = [self.requestFactory createLoginRequestWithUsername:userName andPasword:password];
    self.loginRequest.delegate = self;
    [self.serviceAPI sendRequest:self.loginRequest];
}

@end