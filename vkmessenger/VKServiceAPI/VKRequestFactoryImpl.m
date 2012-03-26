//
//  Created by Vitaliy Ruzhnikov on 18.03.12.
//
//
//


#import "VKRequestFactoryImpl.h"
#import "VKRequest.h"
#import "VKLoginRequest.h"
#import "OxICContainer.h"


@implementation VKRequestFactoryImpl {

}

IoCName(requestFactory)
IoCSingleton
IoCLazy


- (VKRequest *)createLoginRequestWithUsername:(NSString *)username andPasword:(NSString *)password {
    NSLog(@"Create login request");
    return [[[VKLoginRequest alloc] initWithLogin:username andPassword:password] autorelease];
}

@end