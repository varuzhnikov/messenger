//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import <Foundation/Foundation.h>

@class VKRequest;
@class HttpRequestStub;


@interface VKRequestHandler : NSObject

- (void)handleRequest:(VKRequest *)request;

@property(nonatomic, retain) HttpRequestStub *httpRequestStub;

@end