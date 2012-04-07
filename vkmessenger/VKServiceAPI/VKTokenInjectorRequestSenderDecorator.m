//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKTokenInjectorRequestSenderDecorator.h"
#import "VKRequest.h"
#import "VKLoginRequest.h"
#import "OxICContainer.h"


@implementation VKTokenInjectorRequestSenderDecorator {

@private
    id <VKRequestSender> _delegate;
}
IoCName(requestSender)
IoCSingleton
IoCLazy

IoCInject(delegate, httpRequestSender)
@synthesize delegate = _delegate;




- (id)initWithDelegate:(id<VKRequestSender>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)sendRequest:(VKRequest *)request {
    if (self.delegate.token != nil) {
        [request setGetParameterWithName:TOKEN_PARAM_NAME andValue:self.token];
    }
    [self.delegate sendRequest:request];
}

- (NSString *)token {
    return self.delegate.token;

}

- (void)setToken:(NSString *)aToken {
    self.delegate.token = aToken;
}


- (void)dealloc {
    self.delegate = nil;
    [super dealloc];
}

@end