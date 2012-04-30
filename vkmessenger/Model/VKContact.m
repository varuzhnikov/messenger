//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKContact.h"
#import "NSString+Additions.h"


@implementation VKContact {

}
@synthesize uid = _uid;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize nickname = _nickname;
@synthesize online = _online;
@synthesize photoUrl = _photoUrl;

- (void)dealloc {
    [_firstName release];
    [_lastName release];
    [_nickname release];
    [_photoUrl release];
    [super dealloc];
}

- (NSString *)fullName {
    if ([NSString isEmpty:self.firstName] && [NSString isEmpty:self.lastName]) {
        return @"";
    }

    if ([NSString isEmpty:self.firstName]) {
            return self.lastName;
        }

    if ([NSString isEmpty:self.lastName]) {
        return self.firstName;
    }

    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];

}


@end