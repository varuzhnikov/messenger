//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKRequestHandler.h"
#import "HttpRequestStub.h"


@implementation VKRequestHandler {

@private
    HttpRequestStub *_httpRequestStub;
}
@synthesize httpRequestStub = _httpRequestStub;


- (id)init {
    self = [super init];
    if (self) {
        _httpRequestStub = [[HttpRequestStub alloc] init];
    }

    return self;
}


- (void)handleRequest:(VKRequest *)request {

}

- (void)dealloc {
    [_httpRequestStub release];
    [super dealloc];
}


@end