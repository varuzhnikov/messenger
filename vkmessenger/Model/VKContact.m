//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import "VKContact.h"


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


@end