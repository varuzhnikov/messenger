//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import "VKAuthenticator.h"
#import "OxICContainer.h"
#import "VKAsyncRequestSender.h"
#import "VKRequest.h"
#import "VKLoginRequest.h"
#import "VKAuthenticatorDelegate.h"
#import "VKErrorNotifier.h"


@implementation VKAuthenticator {
@private
    id _requestSender;
    id <VKRequestFactory> _requestFactory;
    VKRequest *_loginRequest;
    id <VKErrorNotifier> _errorNotifier;
}

IoCName(authenticator)
IoCSingleton
IoCLazy
IoCInject(requestSender, requestSender )
@synthesize requestSender = _requestSender;

IoCInject(requestFactory, requestFactory)
@synthesize requestFactory = _requestFactory;

IoCInject(errorNotifier, errorNotifier)
@synthesize errorNotifier = _errorNotifier;

@synthesize loginRequest = _loginRequest;

@synthesize delegate = _delegate;

- (void)requestFailed:(VKRequest *)request {
    [self.delegate loginFailed];
    [self.errorNotifier notifyWithError:request.responseError];
}

- (void)requestFinished:(VKRequest *)request {
    VKLoginRequest *loginRequest = (VKLoginRequest *) request;

    self.requestSender.token = loginRequest.token;

    self.loginRequest = nil;

    [self.delegate loginFinished];
}


- (void)dealloc {
    self.requestSender = nil;
    self.requestFactory = nil;
    self.loginRequest = nil;
    self.delegate = nil;
    self.errorNotifier = nil;
    [super dealloc];
}


- (void)loginWithUsername:(NSString *)userName andPassword:(NSString *)password {
    self.loginRequest = [self.requestFactory createLoginRequestWithUsername:userName andPasword:password];
    self.loginRequest.delegate = self;
    [self.requestSender sendRequest:self.loginRequest];
}

@end