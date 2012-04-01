//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import "VKServiceAPIStub.h"
#import "OxICContainer.h"
#import "VKLoginRequest.h"
#import "VKTestConstants.h"
#import "HttpRequestStub.h"


@implementation VKServiceAPIStub {

@private
    NSString *_token;
}
@synthesize token = _token;

IoCName(serviceAPI)
IoCSingleton
IoCLazy

- (void)sendRequest:(VKRequest *)request {

    VKLoginRequest *loginRequest = (VKLoginRequest *) request;
    NSLog(@"username :%@", loginRequest.login);
    NSLog(@"password :%@", loginRequest.password);
    HttpRequestStub *httpRequestStub = [[[HttpRequestStub alloc] init] autorelease];
    if (([loginRequest.login isEqualToString:@"username"]) && ([loginRequest.password isEqualToString:@"password"])) {

        httpRequestStub.responseString = [NSString stringWithFormat:@"{\"%@\":\"token_from_server\"}", TOKEN_PARAM_NAME];
        [request requestFinished:httpRequestStub];
    } else {
        httpRequestStub.responseString = [NSString stringWithFormat:JSON_WITH_ERROR, TOKEN_PARAM_NAME];
        [request requestFailed:httpRequestStub];
        self.token = @"";
    }
}


@end