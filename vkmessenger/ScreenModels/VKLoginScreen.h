//
//  Created by Vitaliy Ruzhnikov on 29.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKAuthenticatorDelegate.h"

@class VKAuthenticator;
@protocol VKLoginScreenDelegate;


@interface VKLoginScreen : NSObject<VKAuthenticatorDelegate>
@property(nonatomic, retain) VKAuthenticator * authenticator;

@property(nonatomic, retain) id<VKLoginScreenDelegate> delegate;
@property(nonatomic, readonly, getter=isWaiting) BOOL isWaiting;

- (void)enteredLogin:(NSString *)login andPassword:(NSString *)password;
@end