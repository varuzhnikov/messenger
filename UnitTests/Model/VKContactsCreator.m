//
//  Created by Vitaliy Ruzhnikov on 03.04.12.
//
//
//


#import "VKContactsCreator.h"
#import "VKContact.h"


@implementation VKContactsCreator {

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

+ (NSMutableArray *)createContacts {
    NSMutableArray *contacts = [NSMutableArray array];

    VKContact *contactAlena = [[[VKContact alloc] init] autorelease];
    contactAlena.nickname = @"Алена";

    VKContact *contactAndrew = [[[VKContact alloc] init] autorelease];
    contactAndrew.nickname = @"Андрей";
    contactAndrew.firstName = @"Андрей";
    contactAndrew.lastName = @"Рогозов";


    VKContact *contactJenny = [[[VKContact alloc] init] autorelease];
    contactJenny.nickname = @"Дженни";

    VKContact *contactIgor = [[[VKContact alloc] init] autorelease];
    contactIgor.nickname = @"Игорь";

    VKContact *contactKomai = [[[VKContact alloc] init] autorelease];
    contactKomai.nickname = @"Комай";
    contactKomai.firstName = @"Мария";
    contactKomai.lastName = @"Кожанова";

    VKContact *contactRate = [[[VKContact alloc] init] autorelease];
    contactRate.nickname = @"Крысюк";

    [contacts addObject:contactAlena];
    [contacts addObject:contactAndrew];
    [contacts addObject:contactJenny];
    [contacts addObject:contactIgor];
    [contacts addObject:contactKomai];
    [contacts addObject:contactRate];

    return contacts;

}


@end