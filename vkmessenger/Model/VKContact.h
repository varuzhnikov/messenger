//
//  Created by Vitaliy Ruzhnikov on 02.04.12.
//
//
//


#import <Foundation/Foundation.h>


@interface VKContact : NSObject

@property(nonatomic, assign) int uid;

@property(nonatomic, copy) NSString *firstName;
@property(nonatomic, copy) NSString *lastName;
@property(nonatomic, copy, readonly) NSString *fullName;


@property(nonatomic, copy) NSString *nickname;


@property(nonatomic, assign, getter=isOnline) BOOL online;

@property(nonatomic, copy) NSString *photoUrl;
@end