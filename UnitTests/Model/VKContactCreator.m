//
//  Created by Vitaliy Ruzhnikov on 03.04.12.
//
//
//


#import "VKContactCreator.h"
#import "VKContact.h"


@implementation VKContactCreator {

}

+ (VKContact *)createContact {
    VKContact *contact = [[[VKContact alloc] init] autorelease];
    contact.uid = 91345978;
    contact.firstName = @"Виталий";
    contact.lastName = @"Ружников";
    contact.nickname = @"";
    contact.photoUrl = @"http://cs5128.userapi.com/u91345978/e_5f1b7c70.jpg";
    contact.online = YES;
    return contact;
}


@end