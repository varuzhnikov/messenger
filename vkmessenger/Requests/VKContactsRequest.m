//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKContactsRequest.h"
#import "SBJson.h"
#import "VKContact.h"


@interface VKContactsRequest ()
- (void)parseContact:(NSDictionary *)contactItem;

@end

@implementation VKContactsRequest {
    NSMutableArray *_contacts;
}
@synthesize contacts = _contacts;


- (id)init {
    self = [super initWithUrlString:METHOD_URL];
    if (self) {
        [self setGetParameterWithName:FIELDS_PARAM_NAME andValue:FIELDS_PARAM_VALUE];
        _contacts  = [[NSMutableArray array] retain];
    }

    return self;
}

- (void)parse {
    id JSONValue = [self.responseString JSONValue];
    NSArray *contacts = [JSONValue objectForKey:RESPONSE_KEY];

    for (NSDictionary *contactItem in contacts) {
        [self parseContact:contactItem];
    }

}

- (void)parseContact:(NSDictionary *)contactItem {
    VKContact *contact = [[VKContact alloc] init];
    contact.uid = [[contactItem objectForKey:UID_KEY] intValue];
    contact.firstName = [contactItem objectForKey:FIRST_NAME_KEY];
    contact.lastName = [contactItem objectForKey:LAST_NAME_KEY];
    contact.nickname = [contactItem objectForKey:NICKNAME_KEY] ;
    contact.photoUrl = [contactItem objectForKey:PHOTO_URL_KEY];
    contact.online = [[contactItem objectForKey:ONLINE_STATUS_KEY] boolValue];
    [_contacts addObject:contact];
    [contact release];
}


- (void)dealloc {
    [_contacts release];
    [super dealloc];
}


@end