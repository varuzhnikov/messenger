//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKRequestFactory.h"
#import "VKRequestDelegate.h"

@protocol VKRequestSender;
@protocol VKAuthenticatorDelegate;
@protocol VKErrorNotifier;


@interface VKAuthenticator : NSObject <VKRequestDelegate>

@property(nonatomic, retain) id <VKRequestSender> requestSender;
@property(nonatomic, retain) id <VKRequestFactory> requestFactory;
@property(nonatomic, retain) id <VKErrorNotifier> errorNotifier;

@property(nonatomic, retain) VKRequest *loginRequest;


@property(nonatomic, retain) id <VKAuthenticatorDelegate> delegate;

- (void)loginWithUsername:(NSString *)userName andPassword:(NSString *)password;
@end