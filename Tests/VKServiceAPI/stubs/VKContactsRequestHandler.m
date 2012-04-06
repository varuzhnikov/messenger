//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKContactsRequestHandler.h"
#import "VKContactsRequest.h"
#import "HttpRequestStub.h"
#import "VKLoginRequest.h"


@implementation VKContactsRequestHandler {

}

- (void)handleRequest:(VKRequest *)aRequest {
    VKContactsRequest *request = (VKContactsRequest *) aRequest;


    if ([request getParameterWithName:TOKEN_PARAM_NAME] == nil) {
        self.httpRequestStub.responseString = @"{\"error\":{\"error_code\":5,\"error_msg\":\"User authorization failed: user revoke access for this token.\",\"request_params\":[{\"key\":\"oauth\",\"value\":\"1\"},"
                "{\"key\":\"method\",\"value\":\"friends.get\"},{\"key\":\"access_token\",\"value\":\"101763a319ea7aa919ea7aa9fe19c10ff2119ea19ea7aab3b43c4968c523d9\"},{\"key\":\"fields\",\"value\":\"first_name,last_name,nickname,photo\"}]}}";
        [request requestFailed:self.httpRequestStub];
        return;
    }

    self.httpRequestStub.responseString = @"{\"response\":[{\"uid\":91345978,\"first_name\":\"Виталий\",\"last_name\":\"Ружников\",\"nickname\":\"\""
            ",\"photo\":\"http://cs5128.userapi.com/u91345978/e_5f1b7c70.jpg\",\"online\":1}]}";

    [request requestFinished:self.httpRequestStub];
}


@end