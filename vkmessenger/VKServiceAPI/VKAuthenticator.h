//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKRequestFactory.h"
#import "VKRequestDelegate.h"

@protocol VKServiceAPI;


@interface VKAuthenticator : NSObject <VKRequestDelegate>

@property(nonatomic, retain) id<VKServiceAPI>  serviceAPI;
@property(nonatomic, retain) id<VKRequestFactory> requestFactory;
@property(nonatomic, retain) VKRequest *loginRequest;


- (void)loginWithUsername:(NSString *)userName andPassword:(NSString *)password;
@end