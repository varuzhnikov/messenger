//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKAbstractRequestSender.h"
#import "VKRequest.h"
#import "ASIHTTPRequest.h"


@implementation VKAbstractRequestSender {
@private
    id _token;
}

@synthesize token = _token;

- (void)sendRequest:(VKRequest *)request {
    ASIHTTPRequest *asiHttpRequest = [ASIHTTPRequest requestWithURL:request.url];

    NSLog(@"send request by url: %@", [request.url absoluteString]);

    [asiHttpRequest setDelegate:request];

    [self startRequest:asiHttpRequest];
}

- (void)startRequest:(ASIHTTPRequest *)asiHttpRequest {
}

- (void)dealloc {
    [_token release];
    [super dealloc];
}


@end