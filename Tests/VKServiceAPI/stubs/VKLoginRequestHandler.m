//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKLoginRequestHandler.h"
#import "VKRequest.h"
#import "VKLoginRequest.h"
#import "VKTestConstants.h"
#import "HttpRequestStub.h"


@implementation VKLoginRequestHandler {

}

- (void)handleRequest:(VKRequest *)request {
    VKLoginRequest *loginRequest = (VKLoginRequest *) request;
    NSLog(@"username :%@", loginRequest.login);
    NSLog(@"password :%@", loginRequest.password);
    if (([loginRequest.login isEqualToString:@"username"]) && ([loginRequest.password isEqualToString:@"password"])) {

        self.httpRequestStub.responseString = [NSString stringWithFormat:@"{\"%@\":\"token_from_server\"}", TOKEN_PARAM_NAME];
        [request requestFinished:self.httpRequestStub];
    } else {
        self.httpRequestStub.responseString = [NSString stringWithFormat:JSON_WITH_ERROR_AND_DESCRIPTION, TOKEN_PARAM_NAME];
        [request requestFailed:self.httpRequestStub];
    }
}


@end