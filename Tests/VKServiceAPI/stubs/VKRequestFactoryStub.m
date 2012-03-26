//
//  Created by Vitaliy Ruzhnikov on 25.03.12.
//
//
//


#import "VKRequestFactoryStub.h"
#import "VKRequest.h"


@implementation VKRequestFactoryStub {

}
- (VKRequest *)createLoginRequestWithUsername:(NSString *)username andPasword:(NSString *)password {

    return [super createLoginRequestWithUsername:username andPasword:password];
}


@end