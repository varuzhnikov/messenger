//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import "VKRequestSenderStub.h"
#import "OxICContainer.h"
#import "VKLoginRequest.h"
#import "VKTestConstants.h"
#import "HttpRequestStub.h"
#import "VKLoginRequestHandler.h"
#import "VKContactsRequestHandler.h"
#import "VKContactsRequest.h"


@implementation VKRequestSenderStub {

@private
    NSString *_token;
    NSMutableDictionary *requestHandlers;
}
@synthesize token = _token;

IoCName(httpRequestSender)
IoCSingleton
IoCLazy

- (id)init {
    self = [super init];
    if (self) {
        requestHandlers = [[NSMutableDictionary alloc] init];
        [requestHandlers setObject:[[[VKLoginRequestHandler alloc] init] autorelease] forKey:[VKLoginRequest class]];
        [requestHandlers setObject:[[[VKContactsRequestHandler alloc] init] autorelease] forKey:[VKContactsRequest class]];
    }

    return self;
}

- (void)dealloc {
    [requestHandlers release];
    [super dealloc];
}


- (void)sendRequest:(VKRequest *)request {
    [[requestHandlers objectForKey:[request class]] handleRequest:request];
}


@end