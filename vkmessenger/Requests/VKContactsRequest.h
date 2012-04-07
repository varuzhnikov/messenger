//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import <Foundation/Foundation.h>
#import "VKRequest.h"

static NSString *const METHOD_URL = @"https://api.vk.com/method/friends.get";
static NSString *const FIELDS_PARAM_NAME = @"fields";
static NSString *const FIELDS_PARAM_VALUE = @"first_name,last_name,nickname,photo";
static NSString *const UID_KEY = @"uid";
static NSString *const FIRST_NAME_KEY = @"first_name";
static NSString *const LAST_NAME_KEY = @"last_name";
static NSString *const NICKNAME_KEY = @"nickname";
static NSString *const PHOTO_URL_KEY = @"photo";
static NSString *const ONLINE_STATUS_KEY = @"online";

@interface VKContactsRequest : VKRequest
@property(nonatomic, readonly) NSArray *contacts;
@end