//
//  Created by Vitaliy Ruzhnikov on 30.03.12.
//
//
//


#import "HttpRequestStub.h"


@implementation HttpRequestStub {

@private
    NSString *_responseString;
}
@synthesize responseString = _responseString;

- (void)dealloc {
    [_responseString release];
    [super dealloc];
}


@end