//
//  Created by Vitaliy Ruzhnikov on 29.03.12.
//
//
//


#import "VKLoginScreen.h"
#import "VKAuthenticator.h"
#import "OxICContainer.h"
#import "VKLoginScreenDelegate.h"


@interface VKLoginScreen ()
- (void)setWaiting:(BOOL)isWaiting;

@end

@implementation VKLoginScreen {

@private
    VKAuthenticator *_authenticator;
    BOOL _isWaiting;
}
IoCName(loginScreen)
IoCSingleton
IoCLazy

IoCInject(authenticator, authenticator)
@synthesize authenticator = _authenticator;

@synthesize delegate = _delegate;
@synthesize isWaiting = _isWaiting;


- (void)setAuthenticator:(VKAuthenticator *)anAuthenticator {
    [_authenticator release];
    _authenticator = [anAuthenticator retain];
    _authenticator.delegate = self;
}

- (void)enteredLogin:(NSString *)login andPassword:(NSString *)password {
    [self setWaiting:YES];
    [self.authenticator loginWithUsername:login andPassword:password];
}

- (void)loginFinished {
    [self setWaiting:NO];
    [self.delegate enterInApplication];
}

- (void)setWaiting:(BOOL)isWaiting {
    _isWaiting = isWaiting;
    if (_isWaiting) {
        [self.delegate startWait];
    } else {
        [self.delegate stopWait];
    }
}

- (void)dealloc {
    self.authenticator = nil;
    self.delegate = nil;
    [super dealloc];
}

@end