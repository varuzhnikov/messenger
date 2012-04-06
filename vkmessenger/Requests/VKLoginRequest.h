//
//  Created by Vitaliy Ruzhnikov on 16.03.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKRequest.h"

static NSString *const GET_TOKEN_URL = @"https://api.vk.com/oauth/token";
static NSString *const USERNAME_PARAM_NAME = @"username";
static NSString *const PASSWORD_PARAM_NAME = @"password";
static NSString *const GRANT_TYPE_PARAM_NAME = @"grant_type";
static NSString *const CLIENT_ID_PARAM_NAME = @"client_id";
static NSString *const CLIENT_SECRET_PARAM_NAME = @"client_secret";
static NSString *const SCOPE_PARAM_NAME = @"scope";
static NSString *const TOKEN_PARAM_NAME = @"access_token";   //TODO move to base class

@interface VKLoginRequest : VKRequest
- (id)initWithLogin:(NSString *)login andPassword:(NSString *)password;


@property(nonatomic, copy) NSString *login;
@property(nonatomic, copy) NSString *password;
@property(nonatomic, copy, readonly) NSString *token;


@end