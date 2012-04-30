//
//  Created by Vitaliy Ruzhnikov on 03.04.12.
//
//
//


#import <Foundation/Foundation.h>

@class VKContact;


@interface VKContactsCreator : NSObject


+ (VKContact *)createContact;

+ (NSMutableArray *)createContacts;
@end